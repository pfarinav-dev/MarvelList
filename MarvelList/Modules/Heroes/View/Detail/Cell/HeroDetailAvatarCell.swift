//
//  HeroDetailAvatarCell.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//

import UIKit

class HeroDetailAvatarCell: UITableViewCell {
    private let avatar = UIImageView(frame: .zero)
    
    func prepare(with image: UIImage) {
        avatar.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(avatar)
        avatar.contentMode = .scaleAspectFill
        avatar.layer.cornerRadius = 10
        avatar.layer.masksToBounds = true
        avatar.layer.borderWidth = 1
        avatar.layer.borderColor = UIColor.darkGray.cgColor
        avatar.image = image
        
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            avatar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            avatar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
    }
}
