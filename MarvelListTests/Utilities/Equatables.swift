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
