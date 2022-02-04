//
//  EventDetailEntity.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//

struct EventDetailEntity: Decodable {
    let available: Int
    let items: [EventItemDetailEntity]

    enum CodingKeys: String, CodingKey {
        case available = "available"
        case items = "items"
    }
}
