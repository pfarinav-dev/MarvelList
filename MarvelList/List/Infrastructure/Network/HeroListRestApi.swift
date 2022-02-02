//
//  HeroListRestApi.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

protocol HeroListRestApi {
    func getHeroList(offset: Int, completionHandler: @escaping (Result<ListEntity, ErrorEntity>) -> Void)
}
