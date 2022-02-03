//
//  ErrorModelToEntityMapperTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import XCTest
@testable import MarvelList

class ErrorModelToEntityMapperTests: XCTestCase {
    var sut: ErrorModelToEntityMapper!
    
    override func setUp() {
        super.setUp()
        sut = ErrorModelToEntityMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testReverseMap() {
        let value = sut.reverseMap(ErrorEntity())
        
        XCTAssertEqual(value.title, Constants.defaultErrorTitle)
        XCTAssertEqual(value.description, Constants.defaultErrorDescription)
    }
}

