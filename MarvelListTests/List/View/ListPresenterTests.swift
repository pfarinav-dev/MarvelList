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
    var useCase: GetHeroesUseCaseMock!
    var listView: ListViewMock!
    
    override func setUp() {
        super.setUp()
        useCase = GetHeroesUseCaseMock()
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
    
    
}
