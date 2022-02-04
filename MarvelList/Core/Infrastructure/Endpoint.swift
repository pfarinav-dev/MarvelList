//
//  Endpoint.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

enum Endpoint {
    enum List: String {
        case list = "characters"
        case detail = "characters/%d"
    }
}
