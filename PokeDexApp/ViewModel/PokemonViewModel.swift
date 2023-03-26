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
    private func getPokemons() async {
        print("getPokemonsが呼ばれました。")
        do {
            let pokemons = try await APIClient.getPokemons()
            print("getPokemons成功")
            pokemonList = pokemons
        } catch {
            print("getPokemons失敗")
            print(error)
        }
    }
}
