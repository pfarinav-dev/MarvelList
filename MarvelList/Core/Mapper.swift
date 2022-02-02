//
//  Mapper.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

class Mapper<T1,T2> {
    func map(_ value: T1) -> T2 {
        fatalError("Not implemented")
    }
    
    func map(_ values: [T1]) -> [T2] {
        return values.map {map($0)}
    }
    
    func reverseMap(_ value: T2) -> T1 {
        fatalError("Not implemented")
    }
    
    func reverseMap(_ values: [T2]) -> [T1] {
        return values.map {reverseMap($0)}
    }
}
