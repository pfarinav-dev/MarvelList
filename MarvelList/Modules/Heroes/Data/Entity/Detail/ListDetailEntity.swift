//
//  HeroDetailEntity.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//

struct ListDetailEntity: Decodable {
    let data: DataDetailEntity

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
