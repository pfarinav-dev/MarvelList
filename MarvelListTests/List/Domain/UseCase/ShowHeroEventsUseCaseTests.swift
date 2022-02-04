//
//  ShowHeroEventsUseCaseTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import XCTest
@testable import MarvelList

class ShowHeroEventsUseCaseTests: XCTestCase {
    var sut: ShowHeroEventsUseCase!
    var repository: HeroListRepositoryMock!
    
    override func setUp() {
        super.setUp()
        repository = HeroListRepositoryMock()
        sut = ShowHeroEventsUseCase(repository: repository)
    }
    
    override func tearDown() {
        sut = nil
        repository = nil
        super.tearDown()
    }
    
    func testSuccesfulCallWithShouldReturnSuccessResultWithEvents() {
        
        let exp = expectation(description: "testSuccesfulCallWithShouldReturnSuccessResultWithEvents")
        
        sut.execute(data: ["identifier": 0]) { result in
            guard case .success(_) = result else {
                return XCTFail("Expected HeroList")
            }
            XCTAssertTrue(self.repository.repositoryCalled)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testFailureCallShouldReturnFailureResultWithErrorModel() {
        repository.shouldSuccess = false
        let exp = expectation(description: "testFailureCallShouldReturnFailureResultWithErrorModel")
        
        sut.execute(data: ["identifier": 0]) { result in
            guard case .failure(_) = result else {
                return XCTFail("Expected HeroList")
            }
            XCTAssertTrue(self.repository.repositoryCalled)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testInvalidIdentifierShouldReturnFailureResultWithErrorModelAndNotCallRepository() {
        let exp = expectation(description: "testInvalidIdentifierShouldReturnFailureResultWithErrorModelAndNotCallRepository")
        
        sut.execute(data: nil) { result in
            guard case .failure(_) = result else {
                return XCTFail("Expected HeroList")
            }
            XCTAssertFalse(self.repository.repositoryCalled)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
}

