//
//  HeroesNSURLRestApi.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import Foundation

class HeroesNSURLRestApi: HeroesRestApi {
    private let session: URLSession
    private let domain: DomainNetwork<Endpoint.List>
    
    init(session: URLSession, domain: DomainNetwork<Endpoint.List>) {
        self.session = session
        self.domain = domain
    }
    
    func getHeroList(offset: Int, completionHandler: @escaping (Result<ListEntity, ErrorEntity>) -> Void) {
        guard let url = URL(string: String(format: domain.url(for: .list), offset) ) else {
            completionHandler(.failure(ErrorEntity()))
            return
        }

        var req = URLRequest(url: url)
        req.httpMethod = HTTPMethod.GET.rawValue
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with: req) { data, _, _ in
            guard let data = data else {
                completionHandler(.failure(ErrorEntity()))
                return
            }
            
            do{
                let listEntity = try JSONDecoder().decode(ListEntity.self, from: data)
                completionHandler(.success(listEntity))
            } catch {
                completionHandler(.failure(ErrorEntity()))
            }
        }
        
        task.resume()
    }
    
    func getHeroDetail(identifier: Int, completionHandler: @escaping (Result<ListDetailEntity, ErrorEntity>) -> Void) {
        guard let url = URL(string: String(format: domain.url(for: .detail), identifier) ) else {
            completionHandler(.failure(ErrorEntity()))
            return
        }

        var req = URLRequest(url: url)
        req.httpMethod = HTTPMethod.GET.rawValue
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with: req) { data, _, _ in
            guard let data = data else {
                completionHandler(.failure(ErrorEntity()))
                return
            }
            
            do{
                let listEntity = try JSONDecoder().decode(ListDetailEntity.self, from: data)
                completionHandler(.success(listEntity))
            } catch {
                completionHandler(.failure(ErrorEntity()))
            }
        }
        
        task.resume()
    }
}

