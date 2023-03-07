//
//  PokemonModel.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/07.
//

import Foundation

struct Pokemon: Identifiable {
    let id = UUID()
    let name: String
    let sprites: Sprites
}

struct Sprites: Decodable {
    let frontImage: URL
    
    enum CodingKeys: String, CodingKey {
        case frontImage = "front_default"
    }
}
