//
//  UseCase.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//
import Foundation

class UseCase<T> {    
    func execute(data: [String: Any]?, completionHandler: @escaping(Result<T, ErrorModel>) -> Void) {
        fatalError("UseCase:Execute must be implemented")
    }
}
