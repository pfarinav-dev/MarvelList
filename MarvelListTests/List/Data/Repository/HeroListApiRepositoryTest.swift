//
//  HeroListApiRepositoryTest.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import XCTest
@testable import MarvelList

class HeroListApiRepositoryTest: XCTestCase {
    var sut: HeroListApiRepository!
    var restApi: HeroListRestApiMock!
    
    override func setUp() {
        super.setUp()
        restApi = HeroListRestApiMock()
        sut = HeroListApiRepository(
            restApi: restApi,
            heroMapper: HeroModelToEntityMapper(),
            listMapper: ListModelToEntityMapper(),
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
}
