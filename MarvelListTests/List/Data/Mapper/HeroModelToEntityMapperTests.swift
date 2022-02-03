//
//  HeroModelToEntityMapperTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import XCTest
@testable import MarvelList

class HeroModelToEntityMapperTests: XCTestCase {
    var sut: HeroModelToEntityMapper!
    
    override func setUp() {
        super.setUp()
        sut = HeroModelToEntityMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testReverseMap() {
        let entityData = getDataFromJson(with: "GET_getHeroes_200")
        let entity = try! JSONDecoder().decode(ListEntity.self, from: entityData)
        
        let value = sut.reverseMap(entity)
        
        XCTAssertEqual(value.first!.description, entity.data.heroes.first!.description)
        XCTAssertEqual(value.first!.identifier, entity.data.heroes.first!.identifier)
        XCTAssertEqual(value.first!.name, entity.data.heroes.first!.name)
        XCTAssertEqual(value.first!.thumbnail, entity.data.heroes.first!.thumbnail.path+"."+entity.data.heroes.first!.thumbnail.extension.rawValue)
    }
}
