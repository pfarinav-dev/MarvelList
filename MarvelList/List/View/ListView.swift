//
//  ListView.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

protocol ListView: AnyObject {
    func loadHeroes(_ list: (listData: ListData, heroes: [Heroe]))
}
