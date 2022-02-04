//
//  NavigationControllerMock.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 04-02-22.
//

import UIKit

class NavigationControllerMock: UINavigationController {
    
    var didPushView = false
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        didPushView = true
    }
}
