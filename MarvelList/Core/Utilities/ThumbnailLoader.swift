//
//  ThumbnailLoader.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import UIKit

let dataCache = NSCache<NSString, NSData>()

class ThumbnailLoader {
    func load(_ url: URL, completionHandler: @escaping(Data) -> Void) -> URLSessionDataTask? {
        if let cachedData = dataCache.object(forKey: url.absoluteString as NSString) {
            let data = cachedData as Data
            completionHandler(data)
            return nil
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data else {
                return
            }
        
            dataCache.setObject(data as NSData, forKey: url.absoluteString as NSString)
            completionHandler(data)
        })

        task.resume()

        return task
    }
}

