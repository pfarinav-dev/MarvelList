//
//  HeroListRestApiMock.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

@testable import MarvelList
import XCTest

class HeroListRestApiMock: XCTestCase, HeroesRestApi {
    var shouldSuccess = true
    
    func getHeroList(offset: Int, completionHandler: @escaping (Result<ListEntity, ErrorEntity>) -> Void) {
        if shouldSuccess {
            let data = getDataFromJson(with: "GET_getHeroes_200")
            let entity = try! JSONDecoder().decode(ListEntity.self, from: data)
            completionHandler(.success(entity))
        } else {
            completionHandler(.failure(ErrorEntity()))
        }
    }
    
    func getHeroDetail(identifier: Int, completionHandler: @escaping (Result<ListDetailEntity, ErrorEntity>) -> Void) {
        if shouldSuccess {
            let data = getDataFromJson(with: "GET_getHeroDetail_200")
            let entityDetail = try! JSONDecoder().decode(ListDetailEntity.self, from: data)
            completionHandler(.success(entityDetail))
        } else {
            completionHandler(.failure(ErrorEntity()))
        }
    }
}
