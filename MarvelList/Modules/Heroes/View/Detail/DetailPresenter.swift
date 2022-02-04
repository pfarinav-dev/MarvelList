//
//  DetailPresenter.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailView?
    
    private let useCase: UseCase<[Event]>
    
    
    init(useCase: UseCase<[Event]>) {
        self.useCase = useCase
    }
    
    func getEvents(identifier: Int) {
        useCase.execute(data: ["identifier": identifier]) { result in
            switch result {
            case .success(let events):
                self.view?.loadEvents(events)
            case .failure(let error):
                self.view?.showError(error)
            }
        }
    }
}

