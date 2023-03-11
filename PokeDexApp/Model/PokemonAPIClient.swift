//
//  PokemonAPIClient.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/10.
//

import Foundation

final class PokemonAPIClient {
    
    //
    func fetch(url: String) async -> Pokemon? {
        guard let reqestURL = URL(string: url) else {
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: reqestURL)
            let result = try JSONDecoder().decode(Pokemon.self, from: data)
            return result
        } catch {
            return nil
        }
    }
    
    //ポケモン151体分のリクエストURL作成メソッド
    func getURLs() -> [String] {
        let pokemonIdRange = 906...1008
        let url: [String] = pokemonIdRange.map {
            "https://pokeapi.co/api/v2/pokemon/\($0)/"
        }
        return url
    }
}
