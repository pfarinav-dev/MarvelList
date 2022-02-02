//
//  HeroListRepository.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

protocol HeroListRepository {
    func getHeroesList(offset: Int, completionHandler: @escaping (Result<(listData: ListData, heroes: [Heroe]), ErrorModel>) -> Void)
}
