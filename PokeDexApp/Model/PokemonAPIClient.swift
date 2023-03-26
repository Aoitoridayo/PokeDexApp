//
//  PokemonAPIClient.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/10.
//

import Foundation

final class PokemonAPIClient {
    
    //102回通信を行い配列化して返すメソッド
    func getPokemons() async throws -> [Pokemon] {
        var pokemonList: [Pokemon] = []
        let urls = getURLs()
        
        do {
            for url in urls {
                let pokemon = try await fetch(url: url)
                pokemonList.append(pokemon)
            }
            return pokemonList
        } catch {
            switch error as? APIError ?? APIError.unknown {
            case .invalidURL:
                throw APIError.invalidURL
            case .networkError:
                throw APIError.networkError
            default:
                throw APIError.unknown
            }
        }
    }
    
    //ポケモン一匹分のデータを返す
    private func fetch(url: String) async throws -> Pokemon {
        guard let reqestURL = URL(string: url) else {
            throw APIError.invalidURL
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: reqestURL)
            let result = try JSONDecoder().decode(Pokemon.self, from: data)
            return result
        } catch {
            throw APIError.networkError
        }
    }
    
    //ポケモン151体分のリクエストURL作成メソッド
    private func getURLs() -> [String] {
        let pokemonIdRange = 1...151
        let url: [String] = pokemonIdRange.map {
            "https://pokeapi.co/api/v2/pokemon/\($0)/"
        }
        return url
    }
}
