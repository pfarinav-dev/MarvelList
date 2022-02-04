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
    
    
    override func setUp() {
        super.setUp()
        presenter = ListPresenterMock()
        sut = ListViewController(presenter: presenter)
        presenter.view = sut
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
        super.tearDown()
    }
}
