//
//  HeroListCellConstants.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import UIKit

enum HeroListCellConstants {
    static let cornerRadius: CGFloat = 5
    static let defaultImage = UIImage(named: "image-not-found")
    static let fontSize: CGFloat = 16
    
    enum Anchors {
        enum Image {
            static let height: CGFloat = 60
            static let width: CGFloat = 60
            static let top: CGFloat = 10
            static let bottom: CGFloat = -10
            static let leading: CGFloat = 20
        }
        
        enum Label {
            static let trailing: CGFloat = -20
            static let leading: CGFloat = 20
        }
    }
}
