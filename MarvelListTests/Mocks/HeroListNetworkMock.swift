//
//  HeroListNetworkMock.swift
//  MarvelListTests
//
//  Created by Patricio Fariña on 03-02-22.
//

import Foundation
@testable import MarvelList

class HeroListNetworkMock: DomainNetwork<Endpoint.List> {
    var shouldReturnValidURL = true
    override func url(for endpoint: Endpoint.List) -> String {
        return shouldReturnValidURL ? "https://developer.marvel.com/" : "%"
    }
}
