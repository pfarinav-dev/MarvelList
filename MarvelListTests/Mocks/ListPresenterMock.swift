//
//  ListPresenterMock.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 04-02-22.
//

@testable import MarvelList

class ListPresenterMock: ListPresenterProtocol {
    var view: ListView?
    
    var getHeroesCalled = false
    func getHeroes(offset: Int) {
        getHeroesCalled = true
    }
    
    
}

