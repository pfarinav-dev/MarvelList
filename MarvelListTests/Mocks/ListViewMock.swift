//
//  ListViewMock.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

@testable import MarvelList

class ListViewMock: ListView {
    
    var loadHeroesCalled = false
    func loadHeroes(_ list: HeroList) {
        loadHeroesCalled = true
    }
    
    var showErrorCalled = false
    func showError(_ error: ErrorModel) {
        showErrorCalled = true
    }
    
    
}
