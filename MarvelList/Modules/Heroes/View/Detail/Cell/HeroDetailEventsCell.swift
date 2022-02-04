//
//  HeroDetailEventsCell.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//

import UIKit

class HeroDetailEventsCell: UITableViewCell {
    typealias HDConstants = HeroDetailEventsCellConstants
    private let title = UILabel(frame: .zero)
    private let eventsContainer = UIStackView(frame: .zero)
    private(set) var eventsLoaded = false
    
    private func prepareTitle() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = HDConstants.title
        title.font = HDConstants.titleFont
        title.textAlignment = .left
        
        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: HDConstants.Anchors.Title.leading
            ),
            title.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: HDConstants.Anchors.Title.top
            )
        ])
    }
    
    func prepare(with events: [Event]) {
        if eventsLoaded {
            return
        }
        
        eventsLoaded = !events.isEmpty
        
        prepareTitle()
        
        eventsContainer.translatesAutoresizingMaskIntoConstraints = false
        eventsContainer.axis = .vertical
        eventsContainer.spacing = HDConstants.stackViewSpacing
        for event in events {
            let label = UILabel(frame: .zero)
            label.font = HDConstants.eventFont
            label.text = String(format: HDConstants.eventText, event.name)
            eventsContainer.addArrangedSubview(label)
        }
        
        contentView.addSubview(eventsContainer)
        
        NSLayoutConstraint.activate([
            eventsContainer.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: HDConstants.Anchors.Event.leading
            ),
            eventsContainer.topAnchor.constraint(
                equalTo: title.bottomAnchor,
                constant: HDConstants.Anchors.Event.top
            ),
            eventsContainer.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: HDConstants.Anchors.Event.trailing
            ),
            eventsContainer.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: HDConstants.Anchors.Event.bottom
            ),
        ])
    }
}
