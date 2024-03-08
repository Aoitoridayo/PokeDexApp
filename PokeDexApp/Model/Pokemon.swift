//
//  Pokemon.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2024/03/07.
//

import Foundation

struct Pokemon: Identifiable {
    let id: String
    let name: String
    let imageURL: URL
    let types: [PokemonType]
    let stats: [Stats]
    
    struct Stats {
        let value: Int
        let name: String
    }
    
    init(pokemonDTO: PokemonDTO) {
        self.id = pokemonDTO.id
        self.name = pokemonDTO.name
        self.imageURL = pokemonDTO.sprites.frontImage
        self.types = pokemonDTO.types.map {
            PokemonType(type: $0.type.name)
        }
        self.stats = pokemonDTO.stats.map {
            Stats(value: $0.value, name: $0.stat.name)
        }
    }
}
