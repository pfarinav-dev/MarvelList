//
//  ListModelToEntityMapper.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

class ListModelToEntityMapper: Mapper<ListData, ListEntity> {
    override func reverseMap(_ value: ListEntity) -> ListData {
        return ListData(total: value.data.totalHeroes)
    }
}
