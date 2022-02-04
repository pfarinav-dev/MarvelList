//
//  EventItemDetailEntity.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//

struct EventItemDetailEntity: Decodable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
