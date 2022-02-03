//
//  ShowHeroListUseCase.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

class ShowHeroListUseCase: UseCase<HeroList> {
    private let repository: HeroListRepository
    
    init(repository: HeroListRepository) {
        self.repository = repository
    }
    
    override func execute(data: [String: Any]?, completionHandler: @escaping (Result<HeroList, ErrorModel>) -> Void) {
        guard let offset = data?[ListConstants.offsetKey] as? Int else {
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
