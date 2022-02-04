//
//  DetailViewMock.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

@testable import MarvelList

class DetailViewMock: DetailView {
    
    var loadEventsCalled = false
    func loadEvents(_ events: [Event]) {
        loadEventsCalled = true
    }
    
    var showErrorCalled = false
    func showError(_ error: ErrorModel) {
        showErrorCalled = true
    }
    
    
}
