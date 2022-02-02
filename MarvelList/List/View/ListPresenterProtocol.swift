//
//  ListPresenterProtocol.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

protocol ListPresenterProtocol {
    var view: ListView? { get set }
    func getHeroes(offset: Int)
}
