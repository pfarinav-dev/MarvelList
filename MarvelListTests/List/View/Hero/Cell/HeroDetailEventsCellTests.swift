//
//  HeroDetailEventsCellTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import XCTest
@testable import MarvelList

class HeroDetailEventsCellTests: XCTestCase {
    var sut: HeroDetailEventsCell!
    
    override func setUp() {
        super.setUp()
        sut = HeroDetailEventsCell()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSetEventsShouldAddSameNumberOfItemsInStackView() {
        sut.prepare(with: [Event(name: "1"), Event(name: "2")])
        XCTAssertEqual((sut.subviews.first!.subviews[1] as! UIStackView).arrangedSubviews.count, 2)
    }
    
    
    func testSetEventsAfterFirstShouldNotChangeNumberOfItemsInStackView() {
        sut.prepare(with: [Event(name: "1"), Event(name: "2")])
        XCTAssertEqual((sut.subviews.first!.subviews[1] as! UIStackView).arrangedSubviews.count, 2)
        
        sut.prepare(with: [Event(name: "3"), Event(name: "4")])
        XCTAssertEqual((sut.subviews.first!.subviews[1] as! UIStackView).arrangedSubviews.count, 2)
        XCTAssertEqual(((sut.subviews.first!.subviews[1] as! UIStackView).arrangedSubviews[0] as! UILabel).text, "· 1")
    }
}

