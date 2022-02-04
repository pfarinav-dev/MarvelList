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
        let list = (
            listData: ListData(total: 10),
            heroes: [
                Hero(
                    identifier: 1,
                    name: "a",
                    description: "a",
                    thumbnail: "a"),
                Hero(
                    identifier: 2,
                    name: "b",
                    description: "b",
                    thumbnail: "b")
            ]
        )
        view?.loadHeroes(list)
    }
    
    
}

