//
//  ShowHeroEventsUseCase.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//

class ShowHeroEventsUseCase: UseCase<[Event]> {
    private let repository: HeroesRepository
    
    init(repository: HeroesRepository) {
        self.repository = repository
    }
    
    override func execute(data: [String : Any]?, completionHandler: @escaping (Result<[Event], ErrorModel>) -> Void) {
        guard let identifier = data?[ListConstants.identifierKey] as? Int else {
            completionHandler(.failure(ErrorModel()))
            return
        }
        
        repository.getHeroDetail(identifier: identifier) { result in
            switch result {
            case .success(let events):
                completionHandler(.success(events))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
