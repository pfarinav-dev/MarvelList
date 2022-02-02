//
//  ListEntity.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

struct ListEntity: Decodable {
    let code: Int
    let status: String
    let data: DataEntity

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case status = "status"
        case data = "data"
    }
}
