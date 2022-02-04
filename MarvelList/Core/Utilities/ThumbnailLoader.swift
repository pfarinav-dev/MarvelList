//
//  ThumbnailLoader.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import UIKit

let dataCache = NSCache<NSString, NSData>()

class ThumbnailLoader {
    func load(_ url: URL, container: UIImageView) {
        if let cachedData = dataCache.object(forKey: url.absoluteString as NSString) {
            let data = cachedData as Data
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                container.image = image
            }
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data else {
                return
            }
        
            dataCache.setObject(data as NSData, forKey: url.absoluteString as NSString)
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                container.image = image
            }
        })
        
        task.resume()
    }
}

