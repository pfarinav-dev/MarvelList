//
//  HeroDetailEventsCellConstants.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//

import UIKit

enum HeroDetailEventsCellConstants {
    static let title = "Eventos Destacados"
    static let titleFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    static let stackViewSpacing: CGFloat = 10
    static let eventFont = UIFont.systemFont(ofSize: 14, weight: .semibold)
    static let eventText = "· %@"
    
    enum Anchors {
        enum Title {
            static let leading: CGFloat = 20
            static let top: CGFloat = 20
        }
        
        enum Event {
            static let leading: CGFloat = 20
            static let top: CGFloat = 20
            static let trailing: CGFloat = -20
            static let bottom: CGFloat = -20
        }
    }
}
