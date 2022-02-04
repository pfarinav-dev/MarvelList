@testable import MarvelList

extension ListEntity: Equatable {
    public static func == (lhs: ListEntity, rhs: ListEntity) -> Bool {
        return lhs.code == rhs.code
            && lhs.status == rhs.status
            && lhs.data == rhs.data
    }
}

extension DataEntity: Equatable {
    public static func == (lhs: DataEntity, rhs: DataEntity) -> Bool {
        return lhs.heroes == rhs.heroes
            && lhs.totalHeroes == rhs.totalHeroes
    }
}

extension HeroEntity: Equatable {
    public static func == (lhs: HeroEntity, rhs: HeroEntity) -> Bool {
        return lhs.description == rhs.description
            && lhs.identifier == rhs.identifier
            && lhs.name == rhs.name
            && lhs.thumbnail == rhs.thumbnail
    }
}

extension Thumbnail: Equatable {
    public static func == (lhs: Thumbnail, rhs: Thumbnail) -> Bool {
        return lhs.path == rhs.path && lhs.extension.rawValue == rhs.extension.rawValue
    }
}

extension ListDetailEntity: Equatable {
    public static func == (lhs: ListDetailEntity, rhs: ListDetailEntity) -> Bool {
        return lhs.data.events == rhs.data.events
    }
}

extension EventsDetailEntity: Equatable {
    public static func == (lhs: EventsDetailEntity, rhs: EventsDetailEntity) -> Bool {
        return lhs.events.available == rhs.events.available
            && lhs.events.items == rhs.events.items
    }
}

extension EventItemDetailEntity: Equatable {
    public static func == (lhs: EventItemDetailEntity, rhs: EventItemDetailEntity) -> Bool {
        return lhs.name == rhs.name
    }
}
