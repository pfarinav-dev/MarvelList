//
//  HeroDetailEventsCell.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//

import UIKit

class HeroDetailEventsCell: UITableViewCell {
    private let title = UILabel(frame: .zero)
    private let eventsContainer = UIStackView(frame: .zero)
    private(set) var eventsLoaded = false
    
    private func prepareTitle() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Eventos Destacados"
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        title.textAlignment = .left
        
        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
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
        eventsContainer.spacing = 10
        for event in events {
            let label = UILabel(frame: .zero)
            label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            label.text = "· \(event.name)"
            eventsContainer.addArrangedSubview(label)
        }
        
        contentView.addSubview(eventsContainer)
        
        NSLayoutConstraint.activate([
            eventsContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            eventsContainer.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            eventsContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            eventsContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
}
