//
//  DetailPresenterTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import XCTest
@testable import MarvelList

class DetailPresenterTests: XCTestCase {
    var sut: DetailPresenter!
    var useCase: ShowHeroEventsUseCaseMock!
    var detailView: DetailViewMock!
    
    override func setUp() {
        super.setUp()
        useCase = ShowHeroEventsUseCaseMock()
        detailView = DetailViewMock()
        sut = DetailPresenter(useCase: useCase)
        sut.view = detailView
    }
    
    override func tearDown() {
        sut = nil
        useCase = nil
        detailView = nil
        super.tearDown()
    }
    
    func testSuccessfulCallShouldCallViewLoadHeroes() {
        let exp = expectation(forNotification: HDGHNotification, object: nil)
        sut.getEvents(identifier: 0)
        wait(for: [exp], timeout: 2)
        XCTAssertTrue(detailView.loadEventsCalled)
    }
    
    func testFailedCallShouldCallViewShowError() {
        useCase.shouldSuccess = false
        let exp = expectation(forNotification: HDGHNotification, object: nil)
        sut.getEvents(identifier: 0)
        wait(for: [exp], timeout: 2)
        XCTAssertTrue(detailView.showErrorCalled)
    }
    
    
}

