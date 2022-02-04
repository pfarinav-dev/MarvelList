//
//  DetailPresenterProtocol.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//

protocol DetailPresenterProtocol {
    var view: DetailView? { get set }
    func getEvents(identifier: Int)
}

