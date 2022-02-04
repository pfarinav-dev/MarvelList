//
//  DetailViewControllerTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 04-02-22.
//

import XCTest
@testable import MarvelList

class DetailViewControllerTests: XCTestCase {
    var sut: DetailViewController!
    var presenter: DetailPresenterMock!
    var navigationController: NavigationControllerMock!
    
    override func setUp() {
        super.setUp()
        presenter = DetailPresenterMock()
        sut = DetailViewController(presenter: presenter)
        presenter.view = sut
        
        navigationController = NavigationControllerMock(rootViewController: sut)
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
        navigationController = nil
        super.tearDown()
    }
    
    func testOnViewDidLoadWithValidIdentifierShouldCallPresenterGetEvents() {
        sut.hero = Hero(identifier: 1, name: "", description: "", thumbnail: "")
        sut.viewDidLoad()
        XCTAssertTrue(presenter.getEventsCalled)
    }
    
    func testOnViewDidLoadWithoutValidIdentifierShouldNotCallPresenterGetEvents() {
        sut.viewDidLoad()
        XCTAssertFalse(presenter.getEventsCalled)
    }
}
