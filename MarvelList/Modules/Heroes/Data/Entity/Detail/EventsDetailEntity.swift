//
//  EventsDetailEntity.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//

struct EventsDetailEntity: Decodable {
    let events: EventDetailEntity


    enum CodingKeys: String, CodingKey {
        case events = "events"
    }
}
