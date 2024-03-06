//
//  PokemonAPIClient.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/10.
//

import Foundation

final class PokemonAPIClient {
    
    func fetchPokemon(number: Int) async throws -> Pokemon {
        guard let url = URLCreater().createURL(number: number).url else {
            throw APIError.invalidURL
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(Pokemon.self, from: data)
        } catch {
            throw APIError.networkError
        }
    }
}
