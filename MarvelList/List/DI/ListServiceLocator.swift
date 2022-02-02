//
//  ListServiceLocator.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import Foundation

class ListServiceLocator {
    private var session = URLSession.shared
    
    private lazy var restApi = HeroListNSURLRestApi(session: session)
    
    private lazy var repository = HeroListApiRepository(
        restApi: restApi,
        heroeMapper: HeroeModelToEntityMapper(),
        listMapper: ListModelToEntityMapper(),
        errorMapper: ErrorModelToEntityMapper())
    
    lazy var showListUseCase = ShowHeroeListUseCase(repository: repository)
}
