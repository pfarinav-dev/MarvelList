//
//  GetHeroesUseCaseMock.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

@testable import MarvelList
import Foundation

let HLGHNotification = NSNotification.Name(rawValue: "HLGHNotification")

class GetHeroesUseCaseMock: UseCase<HeroList> {
    var shouldSuccess = true
    
    override func execute(data: [String : Any]?, completionHandler: @escaping (Result<HeroList, ErrorModel>) -> Void) {
        if shouldSuccess {
            let listData = ListData(total: 1)
            let heroes = [Hero(identifier: 1, name: "", description: "", thumbnail: "")]
            completionHandler(.success((listData: listData, heroes: heroes)))
        } else {
            completionHandler(.failure(ErrorModel()))
        }
        NotificationCenter.default.post(name: HLGHNotification, object: nil)
    }
}
