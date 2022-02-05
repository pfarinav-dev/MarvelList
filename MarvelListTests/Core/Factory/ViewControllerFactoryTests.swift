//
//  ViewControllerFactoryTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 05-02-22.
//

import XCTest
@testable import MarvelList

class ViewControllerFactoryTests: XCTestCase {
    
    var types: [ViewControllerFactoryType] = [
        .list,
        .detail
    ]
    
    func testViewControllerFactory() {
        for type in types {
            let viewController = ViewControllerFactory.viewController(type: type)
            switch type {
            case .list:
                XCTAssertTrue(viewController is ListViewController)
            default:
                XCTAssertTrue(viewController is DetailViewController)
            }
        }
    }
}
