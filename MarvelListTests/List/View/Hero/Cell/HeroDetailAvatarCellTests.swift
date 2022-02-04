//
//  HeroDetailAvatarCellTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import XCTest
@testable import MarvelList

class HeroDetailAvatarCellTests: XCTestCase {
    var sut: HeroDetailAvatarCell!
    
    override func setUp() {
        super.setUp()
        sut = HeroDetailAvatarCell()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testPrepareWithShouldChangeAvatarImage() {
        let image = UIImage()
        sut.prepare(with: image)
        
        let container = sut.subviews.first!.subviews.first as! UIImageView
        XCTAssertEqual(container.image, image)
    }
}
