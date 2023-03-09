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

//ポケモンのステータス(現段階では未使用)
struct Stats: Decodable {
    let value: Int
    
    enum CodingKeys: String, CodingKey {
        case value = "base_stat"
    }
}
