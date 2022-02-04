//
//  HeroListNetworkTest.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import XCTest
@testable import MarvelList

class HeroListNetworkTest: XCTestCase {
    var sut: HeroesNetwork!
    
    override func setUp() {
        super.setUp()
        sut = HeroesNetwork()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testURLForListShouldReturnStringWithOffsetPlaceholder() {
        let expected = "https://gateway.marvel.com/v1/public/characters?limit=30&ts=1&apikey=fa68d95890cde9ab96d2d32f31dc7506&hash=3b47358f138e20e9f00c231c430da7a0&offset=%d"
        
        let urlString = sut.url(for: .list)
        
        XCTAssertEqual(expected, urlString)
    }
    
    func testURLForDetailShouldReturnStringWithIdentifierPlaceholder() {
        let expected = "https://gateway.marvel.com/v1/public/characters/%d?limit=30&ts=1&apikey=fa68d95890cde9ab96d2d32f31dc7506&hash=3b47358f138e20e9f00c231c430da7a0"
        
        let urlString = sut.url(for: .detail)
        
        XCTAssertEqual(expected, urlString)
    }
    
    
}
