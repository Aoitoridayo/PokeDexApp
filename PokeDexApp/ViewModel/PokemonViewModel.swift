//
//  PokemonViewModel.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/10.


import Foundation

final class PokemonViewModel: ObservableObject {
    //リストに表示するためのインスタンス
    @Published var pokemonList: [Pokemon] = []

    func getPokemons() async {
        let APIClient = PokemonAPIClient()
        do {
            let pokemons = try await APIClient.getPokemons()
            DispatchQueue.main.async {
                self.pokemonList = pokemons
            }
        } catch {
            let error = error as? APIError ?? APIError.unknown
            print(error.title)
        }
    }
}
