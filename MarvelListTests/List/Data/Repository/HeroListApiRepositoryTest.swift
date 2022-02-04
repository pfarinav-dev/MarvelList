//
//  HeroListApiRepositoryTest.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import XCTest
@testable import MarvelList

class HeroListApiRepositoryTest: XCTestCase {
    var sut: HeroesApiRepository!
    var restApi: HeroListRestApiMock!
    
    override func setUp() {
        super.setUp()
        restApi = HeroListRestApiMock()
        sut = HeroesApiRepository(
            restApi: restApi,
            heroMapper: HeroModelToEntityMapper(),
            listMapper: ListModelToEntityMapper(),
            eventsMapper: EventsToEntityMapper(),
            errorMapper: ErrorModelToEntityMapper())
    }
    
    override func tearDown() {
        sut = nil
        restApi = nil
        super.tearDown()
    }
    
    func testSuccesfulCallShouldReturnSuccessResultWithHeroList() {
        
        let exp = expectation(description: "testSuccesfulCallShouldReturnSuccessResultWithEntity")
        
        sut.getHeroesList(offset: 0) { result in
            guard case .success(_) = result else {
                return XCTFail("Expected HeroList")
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testDetailSuccesfulCallShouldReturnSuccessResultWithEvents() {
        
        let exp = expectation(description: "testDetailSuccesfulCallShouldReturnSuccessResultWithEvents")
        
        sut.getHeroDetail(identifier: 0) { result in
            guard case .success(_) = result else {
                return XCTFail("Expected HeroList")
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testFailureCallShouldReturnFailureResultWithErrorModel() {
        restApi.shouldSuccess = false
        let exp = expectation(description: "testFailureCallShouldReturnFailureResultWithErrorModel")
        
        sut.getHeroesList(offset: 0) { result in
            guard case .failure(_) = result else {
                return XCTFail("Expected Error Model")
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testDetailFailureCallShouldReturnFailureResultWithErrorModel() {
        restApi.shouldSuccess = false
        let exp = expectation(description: "testDetailFailureCallShouldReturnFailureResultWithErrorModel")
        
        sut.getHeroDetail(identifier: 0) { result in
            guard case .failure(_) = result else {
                return XCTFail("Expected Error Model")
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
}
