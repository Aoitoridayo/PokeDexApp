//
//  PokemonModel.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/07.
//

import Foundation

//ポケモンのモデル
struct Pokemon: Identifiable, Decodable {
    let name: String
    let sprites: Sprites
    let stats: [Stats]
    
    var id: String { name }
}

//画像データ
struct Sprites: Decodable {
    let frontImage: URL
    
    enum CodingKeys: String, CodingKey {
        case frontImage = "front_default"
    }
}

struct Stats: Identifiable, Decodable {
    let value: Int
    let stat: Stat
    
    var id: String { stat.name }
    enum CodingKeys: String, CodingKey {
        case value = "base_stat"
        case stat
    }
}

struct Stat: Decodable {
    let name: String
}
