//
//  HeroListCellTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import XCTest
@testable import MarvelList

class HeroListCellTests: XCTestCase {
    var sut: HeroListCell!
    
    override func setUp() {
        super.setUp()
        sut = HeroListCell()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testAssignNameShouldChangeNameLabel() {
        sut.prepare()
        sut.name = "test"
        let label = sut.subviews[0].subviews[1] as! UILabel
        XCTAssertEqual(label.text, "test")
    }
    
    func testAssignImageShouldChangeImageContainer() {
        sut.prepare()
        let image = UIImage()
        sut.image = image
        let imageContainer = sut.subviews[0].subviews[0] as! UIImageView
        XCTAssertEqual(imageContainer.image, image)
    }
}
