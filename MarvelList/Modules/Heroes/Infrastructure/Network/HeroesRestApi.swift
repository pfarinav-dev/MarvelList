//
//  HeroesRestApi.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

protocol HeroesRestApi {
    func getHeroList(offset: Int, completionHandler: @escaping (Result<ListEntity, ErrorEntity>) -> Void)
    
    func getHeroDetail(identifier: Int, completionHandler: @escaping (Result<ListDetailEntity, ErrorEntity>) -> Void)
}
