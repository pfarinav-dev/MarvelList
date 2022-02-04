//
//  DataDetailEntity.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//


struct DataDetailEntity: Decodable {
    let events: [EventsDetailEntity]

    enum CodingKeys: String, CodingKey {
        case events = "results"
    }
}
