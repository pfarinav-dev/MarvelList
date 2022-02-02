//
//  ShowHeroeListUseCase.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

class ShowHeroeListUseCase: UseCase<(listData: ListData, heroes: [Heroe])> {
    private let repository: HeroListRepository
    
    init(repository: HeroListRepository) {
        self.repository = repository
    }
    
    override func execute(data: [String: Any]?, completionHandler: @escaping (Result<(listData: ListData, heroes: [Heroe]), ErrorModel>) -> Void) {
        guard let offset = data?["offset"] as? Int else {
            completionHandler(.failure(ErrorModel()))
            return
        }
        repository.getHeroesList(offset: offset) { result in
            switch result {
            case .success(let heroes):
                completionHandler(.success(heroes))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
