//
//  ListServiceLocator.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import Foundation

class ListServiceLocator {
    private let session = URLSession.shared
    private let domain = HeroListNetwork()
    
    private lazy var restApi = HeroListNSURLRestApi(session: session, domain: domain)
    
    private lazy var repository = HeroListApiRepository(
        restApi: restApi,
        heroMapper: HeroModelToEntityMapper(),
        listMapper: ListModelToEntityMapper(),
        errorMapper: ErrorModelToEntityMapper())
    
    lazy var showListUseCase = ShowHeroListUseCase(repository: repository)
}
