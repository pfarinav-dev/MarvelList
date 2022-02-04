//
//  HeroListNSURLRestApiTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 02-02-22.
//

import XCTest
@testable import MarvelList

class HeroListNSURLRestApiTests: XCTestCase {
    var sut: HeroesNSURLRestApi!
    var session: URLSessionMock!
    var domain: HeroListNetworkMock!
    
    override func setUp() {
        super.setUp()
        session = URLSessionMock()
        domain = HeroListNetworkMock()
        sut = HeroesNSURLRestApi(session: session, domain: domain)
    }
    
    override func tearDown() {
        sut = nil
        session = nil
        domain = nil
        super.tearDown()
    }
    
    func testValidDataShouldReturnTupleWithHeroesAndDataList() {
        session.data = getDataFromJson(with: "GET_getHeroes_200")
        let exp = expectation(description: "testSuccessfulCallShouldReturnNotNilCategories")
        let expectedEntity = ListEntity(
            code: 200,
            status: "Ok",
            data: DataEntity(
                heroes: [
                    HeroEntity(
                        identifier: 1010354,
                        name: "Adam Warlock",
                        description: "Adam Warlock is an artificially created human who was born in a cocoon at a scientific complex called The Beehive.",
                        thumbnail: Thumbnail(
                            path: "http://i.annihil.us/u/prod/marvel/i/mg/a/f0/5202887448860",
                            extension: .jpg))
                ],
                totalHeroes: 1559)
        )
        
        sut.getHeroList(offset: 0) { result in
            let value = try! result.get()
            XCTAssertEqual(expectedEntity, value)
            XCTAssertEqual(value.data.totalHeroes, expectedEntity.data.totalHeroes)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testDetailValidDataShouldReturnTupleWithHeroesAndDataList() {
        session.data = getDataFromJson(with: "GET_getHeroDetail_200")
        let exp = expectation(description: "testDetailValidDataShouldReturnTupleWithHeroesAndDataList")
        
        let expectedEntity = ListDetailEntity(
            data: DataDetailEntity(
                events: [
                    EventsDetailEntity(events: EventDetailEntity(
                        available: 4,
                        items: [
                            EventItemDetailEntity(name: "Civil War"),
                            EventItemDetailEntity(name: "Fear Itself"),
                            EventItemDetailEntity(name: "Secret Wars"),
                            EventItemDetailEntity(name: "Siege")
                        ]
                    )
                    )
                ]
            )
        )
        sut.getHeroDetail(identifier: 0) { result in
            let value = try! result.get()
            XCTAssertEqual(value, expectedEntity)
            exp.fulfill()
        }

        wait(for: [exp], timeout: 2)
    }
    
    func testInvalidDataShouldReturnErrorEntity() {
        session.data = getDataFromJson(with: "GET_getHeroes_400")
        let exp = expectation(description: "testInvalidDataShouldReturnErrorEntity")
        
        sut.getHeroList(offset: 0) { result in
            guard case .failure(_) = result else {
                return XCTFail("Expected ErrorEntity")
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testDetailInvalidDataShouldReturnErrorEntity() {
        session.data = getDataFromJson(with: "GET_getHeroDetail_400")
        let exp = expectation(description: "testDetailInvalidDataShouldReturnErrorEntity")
        
        sut.getHeroDetail(identifier: 0) { result in
            guard case .failure(_) = result else {
                return XCTFail("Expected ErrorEntity")
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testNilDataShouldReturnErrorEntity() {
        session.data = nil
        let exp = expectation(description: "testNilDataShouldReturnErrorEntity")
        
        sut.getHeroList(offset: 0) { result in
            guard case .failure(_) = result else {
                return XCTFail("Expected ErrorEntity")
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testDetailNilDataShouldReturnErrorEntity() {
        session.data = nil
        let exp = expectation(description: "testDetailNilDataShouldReturnErrorEntity")
        
        sut.getHeroDetail(identifier: 0) { result in
            guard case .failure(_) = result else {
                return XCTFail("Expected ErrorEntity")
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testInvalidURLShouldReturnErrorEntity() {
        session.data = nil
        domain.shouldReturnValidURL = false
        let exp = expectation(description: "testInvalidURLShouldReturnErrorEntity")
        
        sut.getHeroList(offset: 0) { result in
            guard case .failure(_) = result else {
                return XCTFail("Expected ErrorEntity")
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testDetailInvalidURLShouldReturnErrorEntity() {
        session.data = nil
        domain.shouldReturnValidURL = false
        let exp = expectation(description: "testDetailInvalidURLShouldReturnErrorEntity")
        
        sut.getHeroDetail(identifier: 0) { result in
            guard case .failure(_) = result else {
                return XCTFail("Expected ErrorEntity")
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
}
