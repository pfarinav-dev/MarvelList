//
//  HeroListRepositoryMock.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

@testable import MarvelList

class HeroListRepositoryMock: HeroesRepository {
    var shouldSuccess = true
    var repositoryCalled = false
    func getHeroesList(offset: Int, completionHandler: @escaping (Result<HeroList, ErrorModel>) -> Void) {
        repositoryCalled = true
        if shouldSuccess {
            let listData = ListData(total: 1)
            let heroes = [Hero(identifier: 1, name: "", description: "", thumbnail: "")]
            completionHandler(.success((listData: listData, heroes: heroes)))
        } else {
            completionHandler(.failure(ErrorModel()))
        }
    }
    
    func getHeroDetail(identifier: Int, completionHandler: @escaping (Result<[Event], ErrorModel>) -> Void) {
        repositoryCalled = true
        if shouldSuccess {
            let events = [Event(name: "1")]
            completionHandler(.success(events))
        } else {
            completionHandler(.failure(ErrorModel()))
        }
    }
}
