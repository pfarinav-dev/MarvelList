//
//  ViewControllerFactory.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import UIKit

class ViewControllerFactory {
    private static var listServiceLocator = ListServiceLocator()

    class func viewController(type: ViewControllerFactoryType) -> UIViewController {
        let presenter = ListPresenter(useCase: listServiceLocator.showListUseCase)
        let viewController = ListViewController(presenter: presenter, serviceLocator: ListServiceLocator())
        presenter.view = viewController
        return viewController
    }
}

