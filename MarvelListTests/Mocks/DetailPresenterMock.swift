//
//  DetailPresenterMock.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 04-02-22.
//

@testable import MarvelList

class DetailPresenterMock: DetailPresenterProtocol {
    var view: DetailView?
    
    var getEventsCalled = false
    func getEvents(identifier: Int) {
        getEventsCalled = true
    }
    
    
}


