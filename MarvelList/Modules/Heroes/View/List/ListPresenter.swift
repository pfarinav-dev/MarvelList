//
//  ListPresenter.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import Foundation

class ListPresenter: ListPresenterProtocol {
    weak var view: ListView?
    
    private let useCase: UseCase<HeroList>
    private var isFetching = false
    
    init(useCase: UseCase<HeroList>) {
        self.useCase = useCase
    }
    
    func getHeroes(offset: Int) {
        if isFetching {
            return
        }
        
        isFetching = true
        
        useCase.execute(data: [ListConstants.offsetKey: offset]) { result in
            self.isFetching = false
            switch result {
            case .success(let list):
                self.view?.loadHeroes(list)
            case .failure(let error):
                self.view?.showError(error)
            }
        }
    }
    
}
