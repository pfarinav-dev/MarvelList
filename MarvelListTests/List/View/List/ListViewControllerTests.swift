//
//  ListViewControllerTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 04-02-22.
//

import XCTest
@testable import MarvelList

class ListViewControllerTests: XCTestCase {
    var sut: ListViewController!
    var presenter: ListPresenterMock!
    var navigationController: NavigationControllerMock!
    
    override func setUp() {
        super.setUp()
        presenter = ListPresenterMock()
        sut = ListViewController(presenter: presenter)
        presenter.view = sut
        
        navigationController = NavigationControllerMock(rootViewController: sut)
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
        navigationController = nil
        super.tearDown()
    }
    
    func testOnViewDidLoadShouldCallPresenterGetHeroes() {
        sut.viewDidLoad()
        XCTAssertTrue(presenter.getHeroesCalled)
    }
    
    func testToggleSearchShouldShowSearchBar() {
        sut.viewDidLoad()
        let barButtonItem = sut.navigationItem.rightBarButtonItem!
        
        XCTAssertNil(sut.navigationItem.titleView)
        
        UIApplication.shared.sendAction(
            barButtonItem.action!,
            to: barButtonItem.target,
            from: nil,
            for: nil
        )
        
        XCTAssertNotNil(sut.navigationItem.titleView)
        XCTAssertTrue(sut.navigationItem.titleView is UISearchBar)
        
        UIApplication.shared.sendAction(
            barButtonItem.action!,
            to: barButtonItem.target,
            from: nil,
            for: nil
        )
        
        XCTAssertNil(sut.navigationItem.titleView)
    }
}
