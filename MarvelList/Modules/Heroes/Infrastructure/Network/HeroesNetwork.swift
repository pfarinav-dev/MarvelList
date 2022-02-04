//
//  HeroesNetwork.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import Foundation

class HeroesNetwork: DomainNetwork<Endpoint.List> {
    let limit = 30
    let ts = 1
    let apiKey = "fa68d95890cde9ab96d2d32f31dc7506"
    let hash = "3b47358f138e20e9f00c231c430da7a0"
    
    override func url(for endpoint: Endpoint.List) -> String {
        
        switch endpoint {
        case .list:
            return Constants.apiBaseUrl
                + endpoint.rawValue
                + addQueryParameters()
                + addOffset()
        case .detail:
            return Constants.apiBaseUrl
                + endpoint.rawValue
                + addQueryParameters()
        }
        
    }
    
    private func addQueryParameters() -> String {
        return "?limit=\(limit)&ts=\(ts)&apikey=\(apiKey)&hash=\(hash)"
    }
    
    private func addOffset() -> String {
        return "&offset=%d"
    }
}
