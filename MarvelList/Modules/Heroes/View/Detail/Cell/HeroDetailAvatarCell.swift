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
        avatar.layer.cornerRadius = HeroDetailAvatarCellConstants.cornerRadius
        avatar.layer.masksToBounds = true
        avatar.layer.borderWidth = CGFloat(Digits.one)
        avatar.layer.borderColor = UIColor.darkGray.cgColor
        avatar.image = image
        
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: HeroDetailAvatarCellConstants.Anchors.top
            ),
            avatar.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: HeroDetailAvatarCellConstants.Anchors.trailing
            ),
            avatar.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: HeroDetailAvatarCellConstants.Anchors.bottom
            ),
            avatar.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: HeroDetailAvatarCellConstants.Anchors.leading
            )
        ])
    }
}
