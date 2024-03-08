//
//  PokemonViewModel.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/10.


import Foundation

final class PokemonData: ObservableObject {

    @Published var pokemons: [Pokemon] = []
    @Published var selectedGeneration = Generation.Frist

    @MainActor
    func fetchPomemons() async {
        let APIClient = PokeAPIClient()
        do {
            for number in selectedGeneration.numbers {
                let pokemonDTO = try await APIClient.fetchPokemon(number: number)
                let pokemon = Pokemon(pokemonDTO: pokemonDTO)
                self.pokemons.append(pokemon)
            }
        } catch {
            let error = error as? APIError ?? APIError.unknown
            print(error.title)
        }
    }
}
