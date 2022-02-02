struct HeroEntity: Decodable {
    let identifier: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name = "name"
        case description = "description"
        case thumbnail = "thumbnail"
    }
}

struct Thumbnail: Decodable {
    let path: String
    let `extension`: Extension

    enum CodingKeys: String, CodingKey {
        case path = "path"
        case `extension` = "extension"
    }
}

enum Extension: String, Decodable {
    case gif = "gif"
    case jpg = "jpg"
    case png = "png"
}
