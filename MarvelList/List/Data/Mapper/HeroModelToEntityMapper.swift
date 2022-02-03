//
//  ListModelToEntityMapper.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

class HeroModelToEntityMapper: Mapper<[Hero], ListEntity> {
    override func reverseMap(_ value: ListEntity) -> [Hero] {
        var heroes = [Hero]()
        
        for heroEntity in value.data.heroes {
            heroes.append(
                Hero(
                    identifier: heroEntity.identifier,
                    name: heroEntity.name,
                    description: heroEntity.description,
                    thumbnail: "\(heroEntity.thumbnail.path).\(heroEntity.thumbnail.extension.rawValue)")
            )
        }
        
        return heroes
    }
}
