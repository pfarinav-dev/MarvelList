//
//  HeroesRepository.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

protocol HeroesRepository {
    func getHeroesList(offset: Int, completionHandler: @escaping (Result<HeroList, ErrorModel>) -> Void)
    func getHeroDetail(identifier: Int, completionHandler: @escaping (Result<[Event], ErrorModel>) -> Void)
}
