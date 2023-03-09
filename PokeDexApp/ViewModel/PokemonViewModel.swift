//
//  PokemonViewModel.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/10.
//

import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemonList: [Pokemon] = []
    let APIClient = PokemonAPIClient()
    
    func onAppear() {
        let urls = APIClient.getURLs()
        Task {
            await fetchPokemonData(urls: urls)
        }
    }
    
    @MainActor
    private func fetchPokemonData(urls: [String]) async {
        for url in urls {
            if let pokemon = await APIClient.fetch(url: url) {
                pokemonList.append(pokemon)
            }
            else {
                print("エラー")
            }
        }
    }
}
