//
//  ViewControllerFactory.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import UIKit

class ViewControllerFactory {
    private static var listServiceLocator = HeroesServiceLocator()
    
    class func viewController(type: ViewControllerFactoryType) -> UIViewController {
        switch type {
        case .list:
            let presenter = ListPresenter(useCase: listServiceLocator.showListUseCase)
            let viewController = ListViewController(presenter: presenter)
            presenter.view = viewController
            return viewController
        case .detail:
            let presenter = DetailPresenter(useCase: listServiceLocator.showEventsUseCase)
            let viewController = DetailViewController(presenter: presenter)
            presenter.view = viewController
            return viewController
        }
        
    }
}

