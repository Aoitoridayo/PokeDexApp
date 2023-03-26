//
//  ContentView.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/07.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var pokemonListData = PokemonViewModel()
    var body: some View {
        NavigationStack {
            List(pokemonListData.pokemonList) { pokemon in
                ListRow(pokemon: pokemon)
            }
            .onAppear(perform: pokemonListData.onAppear)
            .navigationTitle("初代ポケモン")
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
