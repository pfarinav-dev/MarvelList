//
//  URLSessionMock.swift
//  RecipesTests
//
//  Created by Patricio Fariña on 04-01-22.
//

import Foundation

class URLSessionMock: URLSession {
    var data: Data?
    var error: Error?
    
    override func dataTask(
        with url: URL,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return URLSessionDataTaskMock {
            completionHandler(self.data, nil, self.error)
        }
    }
    
    override func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return URLSessionDataTaskMock {
            completionHandler(self.data, nil, self.error)
        }
    }
}
