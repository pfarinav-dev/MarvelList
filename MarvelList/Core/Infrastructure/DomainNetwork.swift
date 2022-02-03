//
//  DomainNetwork.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//
import Foundation

class DomainNetwork<T> {
    func url(for endpoint: T) -> String {
        fatalError("DomainNetwork:url must be implemented (at \(String(describing: T.self))")
    }
}
