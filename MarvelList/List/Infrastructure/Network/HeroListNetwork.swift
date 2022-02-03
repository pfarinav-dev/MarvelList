//
//  HeroListNetwork.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import Foundation

class HeroListNetwork: DomainNetwork<Endpoint.List> {
    let limit = 30
    let ts = 1
    let apiKey = "fa68d95890cde9ab96d2d32f31dc7506"
    let hash = "3b47358f138e20e9f00c231c430da7a0"
    
    override func url(for endpoint: Endpoint.List) -> String {
        return Constants.apiBaseUrl
            + endpoint.rawValue
            + addQueryParameters()
    }
    
    private func addQueryParameters() -> String {
        return "?limit=\(limit)&offset=%d&ts=\(ts)&apikey=\(apiKey)&hash=\(hash)"
    }
}
