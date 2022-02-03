//
//  DataEntity.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

struct DataEntity: Decodable {
    let heroes: [HeroEntity]
    let totalHeroes: Int

    enum CodingKeys: String, CodingKey {
        case heroes = "results"
        case totalHeroes = "total"
    }
}
