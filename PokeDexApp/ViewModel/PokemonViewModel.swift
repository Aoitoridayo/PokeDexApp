//
//  PokemonViewModel.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/10.


import Foundation

final class PokemonViewModel: ObservableObject {
    //リストに表示するためのインスタンス
    @Published var pokemonList: [Pokemon] = []
    //API検索モデルのインスタンス
    let APIClient = PokemonAPIClient()
    
    //アプリ起動時に呼び出されるメソッド
    func onAppear() {
        Task {
            await getPokemons()
        }
    }
    
    @MainActor
    private func getPokemons() {
        Task {
            if let pokemons = await APIClient.getPokemons() {
                pokemonList = pokemons
            } else {
                print("エラー")
            }
        }
    }
}
