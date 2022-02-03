//
//  URLSessionDataTaskMock.swift
//  RecipesTests
//
//  Created by Patricio Fariña on 04-01-22.
//
import Foundation

class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}


