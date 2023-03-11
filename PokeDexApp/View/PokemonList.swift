//
//  ContentView.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/07.
//

import SwiftUI

struct PokemonList: View {
    @StateObject var pokemonListData = PokemonViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(pokemonListData.pokemonList) { pokemon in
                    ListRow(pokemon: pokemon)
                }
            }
            .onAppear(perform: pokemonListData.onAppear)
            .navigationTitle("新ポケモン")
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
