//
//  ListServiceLocator.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import Foundation

class HeroesServiceLocator {
    private let session = URLSession.shared
    private let domain = HeroesNetwork()
    
    private lazy var restApi = HeroesNSURLRestApi(session: session, domain: domain)
    
    private lazy var repository = HeroesApiRepository(
        restApi: restApi,
        heroMapper: HeroModelToEntityMapper(),
        listMapper: ListModelToEntityMapper(),
        eventsMapper: EventsToEntityMapper(),
        errorMapper: ErrorModelToEntityMapper())
    
    lazy var showListUseCase = ShowHeroListUseCase(repository: repository)
    lazy var showEventsUseCase = ShowHeroEventsUseCase(repository: repository)
}
