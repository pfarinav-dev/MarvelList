//
//  HeroListNSURLRestApi.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import Foundation

class HeroListNSURLRestApi: HeroListRestApi {
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getHeroList(offset: Int, completionHandler: @escaping (Result<ListEntity, ErrorEntity>) -> Void) {
        guard let url = URL(string: "https://gateway.marvel.com/v1/public/characters?limit=30&offset=\(offset)&ts=1&apikey=fa68d95890cde9ab96d2d32f31dc7506&hash=3b47358f138e20e9f00c231c430da7a0") else {
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
            } catch let error {
                print(error)
                completionHandler(.failure(ErrorEntity()))
            }
        }
        
        task.resume()
    }
}

