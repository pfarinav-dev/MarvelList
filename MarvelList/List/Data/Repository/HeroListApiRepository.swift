//
//  HeroListApiRepository.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

class HeroListApiRepository: HeroListRepository {
    
    private let restApi: HeroListRestApi
    private let heroeMapper: Mapper<[Heroe], ListEntity>
    private let listMapper: Mapper<ListData, ListEntity>
    private let errorMapper: Mapper<ErrorModel, ErrorEntity>
    
    init(
        restApi: HeroListRestApi,
        heroeMapper: Mapper<[Heroe], ListEntity>,
        listMapper: Mapper<ListData, ListEntity>,
        errorMapper: Mapper<ErrorModel, ErrorEntity>) {
        
        self.restApi = restApi
        self.heroeMapper = heroeMapper
        self.listMapper = listMapper
        self.errorMapper = errorMapper
    }
    
    func getHeroesList(offset: Int, completionHandler: @escaping (Result<(listData: ListData, heroes: [Heroe]), ErrorModel>) -> Void) {
        restApi.getHeroList(offset: offset) { result in
            switch result {
            case .success(let listEntity):
                let heroes = self.heroeMapper.reverseMap(listEntity)
                let listData = self.listMapper.reverseMap(listEntity)
                completionHandler(.success((listData: listData, heroes: heroes)))
            case .failure(let errorEntity):
                completionHandler(.failure(self.errorMapper.reverseMap(errorEntity)))
            }
        }
    }
}
