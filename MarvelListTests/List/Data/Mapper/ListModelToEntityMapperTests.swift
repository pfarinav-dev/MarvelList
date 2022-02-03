//
//  ListModelToEntityMapperTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import XCTest
@testable import MarvelList

class ListModelToEntityMapperTests: XCTestCase {
    var sut: ListModelToEntityMapper!
    
    override func setUp() {
        super.setUp()
        sut = ListModelToEntityMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testReverseMap() {
        let entityData = getDataFromJson(with: "GET_getHeroes_200")
        let entity = try! JSONDecoder().decode(ListEntity.self, from: entityData)
        
        let value = sut.reverseMap(entity)
        
        XCTAssertEqual(value.total, entity.data.totalHeroes)
    }
}
