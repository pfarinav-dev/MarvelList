//
//  ListPresenterTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import XCTest
@testable import MarvelList

class ListPresenterTests: XCTestCase {
    var sut: ListPresenter!
    var useCase: ShowHeroesUseCaseMock!
    var listView: ListViewMock!
    
    override func setUp() {
        super.setUp()
        useCase = ShowHeroesUseCaseMock()
        listView = ListViewMock()
        sut = ListPresenter(useCase: useCase)
        sut.view = listView
    }
    
    override func tearDown() {
        sut = nil
        useCase = nil
        listView = nil
        super.tearDown()
    }
    
    func testSuccessfulCallShouldCallViewLoadHeroes() {
        let exp = expectation(forNotification: HLGHNotification, object: nil)
        sut.getHeroes(offset: 0)
        wait(for: [exp], timeout: 2)
        XCTAssertTrue(listView.loadHeroesCalled)
    }
    
    func testFailedCallShouldCallViewShowError() {
        useCase.shouldSuccess = false
        let exp = expectation(forNotification: HLGHNotification, object: nil)
        sut.getHeroes(offset: 0)
        wait(for: [exp], timeout: 2)
        XCTAssertTrue(listView.showErrorCalled)
    }
    
    func testCallWhileFetchingShouldNotCallUseCase() {
        useCase.shouldComplete = false
        let exp = expectation(forNotification: HLGHNotification, object: nil)
        sut.getHeroes(offset: 0)
        XCTAssertTrue(useCase.useCaseCalled)
        useCase.useCaseCalled = false
        
        sut.getHeroes(offset: 0)
        XCTAssertFalse(useCase.useCaseCalled)
        
        wait(for: [exp], timeout: 2)
    }
    
    
}
