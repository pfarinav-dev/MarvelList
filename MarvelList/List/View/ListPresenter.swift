//
//  ListPresenter.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import Foundation

class ListPresenter: ListPresenterProtocol {
    weak var view: ListView?
    
    let useCase: UseCase<(listData: ListData, heroes: [Heroe])>
    
    private var isFetching = false
    
    init(useCase: UseCase<(listData: ListData, heroes: [Heroe])>) {
        self.useCase = useCase
    }
    
    func getHeroes(offset: Int) {
        if isFetching {
            return
        }
        
        isFetching = true
        
        useCase.execute(data: ["offset": offset]) {[weak self] result in
            guard let self = self else {
                return
            }
            
            DispatchQueue.main.async {
                self.isFetching = false
                switch result {
                case .success(let list):
                    self.view?.loadHeroes(list)
                case .failure(let error):
                    print(error)
                }
            }

        }
    }
    
}
