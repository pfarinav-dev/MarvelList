//
//  EventsToEntityMapperTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import XCTest
@testable import MarvelList

class EventsToEntityMapperTests: XCTestCase {
    var sut: EventsToEntityMapper!
    
    override func setUp() {
        super.setUp()
        sut = EventsToEntityMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testReverseMap() {
        let entityData = getDataFromJson(with: "GET_getHeroDetail_200")
        let entityDetail = try! JSONDecoder().decode(ListDetailEntity.self, from: entityData)
        
        let value = sut.reverseMap(entityDetail)
        
        XCTAssertEqual(value.count, entityDetail.data.events.first!.events.items.count)
        XCTAssertEqual(value[0].name, entityDetail.data.events.first!.events.items[0].name)
        XCTAssertEqual(value[1].name, entityDetail.data.events.first!.events.items[1].name)
        XCTAssertEqual(value[2].name, entityDetail.data.events.first!.events.items[2].name)
        XCTAssertEqual(value[3].name, entityDetail.data.events.first!.events.items[3].name)
    }
    
    func testReverseMapWithouthEventsSouldReturnEmptyArray() {
        let entityDetail = ListDetailEntity(data: DataDetailEntity(events: []))
        
        let value = sut.reverseMap(entityDetail)
        XCTAssertEqual(value.count, 0)
        
    }
}

