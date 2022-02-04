//
//  ShowHeroEventsUseCaseMock.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

@testable import MarvelList
import Foundation

let HDGHNotification = NSNotification.Name(rawValue: "HDGHNotification")

class ShowHeroEventsUseCaseMock: UseCase<[Event]> {
    var shouldSuccess = true
    
    override func execute(data: [String : Any]?, completionHandler: @escaping (Result<[Event], ErrorModel>) -> Void) {
        if shouldSuccess {
            completionHandler(.success([Event(name: "1")]))
        } else {
            completionHandler(.failure(ErrorModel()))
        }
        NotificationCenter.default.post(name: HDGHNotification, object: nil)
    }
}
