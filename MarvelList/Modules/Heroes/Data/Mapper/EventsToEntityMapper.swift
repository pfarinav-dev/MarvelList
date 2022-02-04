//
//  EventsToEntityMapper.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//

class EventsToEntityMapper: Mapper<[Event], ListDetailEntity> {
    override func reverseMap(_ value: ListDetailEntity) -> [Event] {
        
        guard let events = value.data.events.first else {
            return []
        }
        
        return events.events.items.map { Event(name: $0.name )}
    }
}
