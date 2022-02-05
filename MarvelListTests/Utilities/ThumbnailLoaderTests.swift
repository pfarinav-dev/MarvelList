//
//  ThumbnailLoaderTests.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 04-02-22.
//

import XCTest
@testable import MarvelList

class ThumbnailLoaderTests: XCTestCase {
    var sut: ThumbnailLoader!
    var session: URLSessionMock!
    var cache: NSCache<NSString, NSData>!
    
    override func setUp() {
        super.setUp()
        session = URLSessionMock()
        cache = NSCache<NSString, NSData>()
        sut = ThumbnailLoader()
        sut.session = session
        sut.cache = cache
    }
    
    override func tearDown() {
        sut = nil
        session = nil
        cache = nil
        super.tearDown()
    }
    
    func testRequestWithNilNadaShouldNotSaveInCache() {
        session.data = nil
        let url = URL(string: "http://fake.data")!
        
        let savedData = getCacheData(for: url.absoluteString)
        XCTAssertNil(savedData)
        let exp = expectation(description: "testRequestWithNilNadaShouldNotSaveInCache")
        
        _ = sut.load(url) { data in
            XCTAssertNil(data)
            exp.fulfill()
        }
        
        let newData = getCacheData(for: url.absoluteString)
        XCTAssertNil(newData)
        
        wait(for: [exp], timeout: 2)
    }
    
    func testRequestWithValidDataForFirstTimeShouldSaveItInCache() {
        let data = Data(count: 10)
        session.data = data
        let url = URL(string: "http://fake.data")!
        
        let savedData = getCacheData(for: url.absoluteString)
        XCTAssertNil(savedData)
        let exp = expectation(description: "testRequestWithValidDataForFirstTimeShouldSaveItInCache")
        
        _ = sut.load(url) { data in
            XCTAssertNotNil(data)
            exp.fulfill()
        }
        
        let newData = getCacheData(for: url.absoluteString)
        
        XCTAssertEqual(data, Data(referencing: newData!))
        XCTAssertTrue(session.dataTaskCalled)
        
        wait(for: [exp], timeout: 2)
    }
    
    func testRequestURLForSecondTimeShouldNotCallTaskAndRetrieveData() {
        let data = Data(count: 10)
        session.data = data
        let url = URL(string: "http://fake.data")!
        
        let savedData = getCacheData(for: url.absoluteString)
        XCTAssertNil(savedData)
        let exp = expectation(description: "testRequestURLForSecondTimeShouldNotCallTaskAndRetrieveData")
        
        _ = sut.load(url) { _ in }
        
        XCTAssertTrue(session.dataTaskCalled)
        session.dataTaskCalled = false
        
        _ = sut.load(url) { data in
            XCTAssertNotNil(data)
            exp.fulfill()
        }
        
        let newData = getCacheData(for: url.absoluteString)
        
        XCTAssertEqual(data, Data(referencing: newData!))
        XCTAssertFalse(session.dataTaskCalled)
        
        wait(for: [exp], timeout: 2)
        
        
    }
    
    private func getCacheData(for key: String) -> NSData? {
        return cache.object(forKey: key as NSString)
    }
}

