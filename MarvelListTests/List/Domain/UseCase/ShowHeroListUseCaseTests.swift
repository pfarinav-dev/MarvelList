//
//  ShowHeroListUseCaseTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import XCTest
@testable import MarvelList

class ShowHeroListUseCaseTests: XCTestCase {
    var sut: ShowHeroListUseCase!
    var repository: HeroListRepositoryMock!
    
    override func setUp() {
        super.setUp()
        repository = HeroListRepositoryMock()
        sut = ShowHeroListUseCase(repository: repository)
    }
    
    override func tearDown() {
        sut = nil
        repository = nil
        super.tearDown()
    }
    
    func testSuccesfulCallWithShouldReturnSuccessResultWithHeroList() {
        
        let exp = expectation(description: "testSuccesfulCallShouldReturnSuccessResultWithEntity")
        
        sut.execute(data: ["offset": 0]) { result in
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
        
        sut.execute(data: ["offset": 0]) { result in
            guard case .failure(_) = result else {
                return XCTFail("Expected HeroList")
            }
            XCTAssertTrue(self.repository.repositoryCalled)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testInvalidOffsetShouldReturnFailureResultWithErrorModelAndNotCallRpository() {
        let exp = expectation(description: "testInvalidOffsetShouldReturnFailureResultWithErrorModelAndNotCallRpository")
        
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

