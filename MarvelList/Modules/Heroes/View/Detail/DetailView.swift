//
//  DetailView.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//

protocol DetailView: AnyObject {
    func loadEvents(_ events: [Event])
    func showError(_ error: ErrorModel)
}
