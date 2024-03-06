//
//  PokemonViewModel.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/10.


import Foundation

final class PokemonViewModel: ObservableObject {

    @Published var pokemonList: [Pokemon] = []
    @Published var selectedGeneration = Generation.Frist

    @MainActor
    func getPokemons() async {
        let APIClient = PokemonAPIClient()
        do {
            for number in selectedGeneration.numbers {
                let pokemon = try await APIClient.fetchPokemon(number: number)
                self.pokemonList.append(pokemon)
            }
        } catch {
            let error = error as? APIError ?? APIError.unknown
            print(error.title)
        }
    }
}
