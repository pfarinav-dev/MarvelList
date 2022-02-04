//
//  HeroesApiRepository.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

class HeroesApiRepository: HeroesRepository {
    private let restApi: HeroesRestApi
    private let heroMapper: Mapper<[Hero], ListEntity>
    private let listMapper: Mapper<ListData, ListEntity>
    private let eventsMapper: Mapper<[Event], ListDetailEntity>
    private let errorMapper: Mapper<ErrorModel, ErrorEntity>
    
    init(
        restApi: HeroesRestApi,
        heroMapper: Mapper<[Hero], ListEntity>,
        listMapper: Mapper<ListData, ListEntity>,
        eventsMapper: Mapper<[Event], ListDetailEntity>,
        errorMapper: Mapper<ErrorModel, ErrorEntity>) {
        
        self.restApi = restApi
        self.heroMapper = heroMapper
        self.listMapper = listMapper
        self.eventsMapper = eventsMapper
        self.errorMapper = errorMapper
    }
    
    func getHeroesList(offset: Int, completionHandler: @escaping (Result<HeroList, ErrorModel>) -> Void) {
        restApi.getHeroList(offset: offset) { result in
            switch result {
            case .success(let listEntity):
                let heroes = self.heroMapper.reverseMap(listEntity)
                let listData = self.listMapper.reverseMap(listEntity)
                completionHandler(.success((listData: listData, heroes: heroes)))
            case .failure(let errorEntity):
                completionHandler(.failure(self.errorMapper.reverseMap(errorEntity)))
            }
        }
    }
    
    func getHeroDetail(identifier: Int, completionHandler: @escaping (Result<[Event], ErrorModel>) -> Void) {
        restApi.getHeroDetail(identifier: identifier) { result in
            switch result {
            case .success(let listDetailEntity):
                let events = self.eventsMapper.reverseMap(listDetailEntity)
                completionHandler(.success(events))
            case .failure(let errorEntity):
                completionHandler(.failure(self.errorMapper.reverseMap(errorEntity)))
            }
        }
    }
}
