//
//  ApiError.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

struct ErrorModel: Error {
    let title: String
    let description: String

    init() {
        self.title = Constants.defaultErrorTitle
        self.description = Constants.defaultErrorDescription
    }
}
