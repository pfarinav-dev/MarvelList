//
//  ErrorModelToEntityMapper.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

class ErrorModelToEntityMapper: Mapper<ErrorModel, ErrorEntity> {
    override func reverseMap(_ value: ErrorEntity) -> ErrorModel {
        return ErrorModel()
    }
}
