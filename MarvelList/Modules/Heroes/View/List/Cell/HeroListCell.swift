//
//  HeroListCell.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import UIKit

class HeroListCell: UITableViewCell {
    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    
    var image: UIImage? {
        didSet {
            imageContainer.image = image
        }
    }
    
    var thumbnailTask: URLSessionDataTask?
    
    private let imageContainer = UIImageView(frame: .zero)
    private let nameLabel = UILabel(frame: .zero)
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageContainer.image = HeroListCellConstants.defaultImage
        thumbnailTask?.cancel()
    }
    
    private func prepareImageContainer() {
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageContainer)
        imageContainer.image = HeroListCellConstants.defaultImage
        imageContainer.contentMode = .scaleAspectFill
        imageContainer.layer.cornerRadius = HeroListCellConstants.cornerRadius
        imageContainer.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            imageContainer.heightAnchor.constraint(
                equalToConstant: HeroListCellConstants.Anchors.Image.height
            ),
            imageContainer.widthAnchor.constraint(
                equalToConstant: HeroListCellConstants.Anchors.Image.width
            ),
            imageContainer.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: HeroListCellConstants.Anchors.Image.top
            ),
            imageContainer.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: HeroListCellConstants.Anchors.Image.bottom
            ),
            imageContainer.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: HeroListCellConstants.Anchors.Image.leading
            )

        ])
    }
    
    private func prepareName() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        nameLabel.font = UIFont.systemFont(ofSize: HeroListCellConstants.fontSize, weight: .bold)
        nameLabel.numberOfLines = Digits.two
        
        NSLayoutConstraint.activate([
            nameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: HeroListCellConstants.Anchors.Label.trailing
            ),
            nameLabel.leadingAnchor.constraint(
                equalTo: imageContainer.trailingAnchor,
                constant: HeroListCellConstants.Anchors.Label.leading
            ),
            nameLabel.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor)
        ])
    }
    
    func prepare() {
        if imageContainer.image == nil {
            prepareImageContainer()
            prepareName()
        }
    }
}
