//
//  ListModelToEntityMapper.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

class HeroeModelToEntityMapper: Mapper<[Heroe], ListEntity> {
    override func reverseMap(_ value: ListEntity) -> [Heroe] {
        var heroes = [Heroe]()
        
        for heroeEntity in value.data.heroes {
            heroes.append(
                Heroe(
                    identifier: heroeEntity.identifier,
                    name: heroeEntity.name,
                    description: heroeEntity.description,
                    thumbnail: "\(heroeEntity.thumbnail.path).\(heroeEntity.thumbnail.extension.rawValue)")
            )
        }
        
        return heroes
    }
}
