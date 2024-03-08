//
//  PokemonCollectionView.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2024/03/07.
//

import SwiftUI

struct PokemonGridView: View {
    @StateObject var pokemonData = PokemonData()
    let columnLayout = Array(repeating: GridItem(), count: 2)
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columnLayout) {
                ForEach(pokemonData.pokemons) { pokemon in
                    GridRow(pokemon: pokemon)
                        .padding(10)
                }
            }
        }
        .padding()
        .task {
            await pokemonData.fetchPomemons()
        }
    }
}

#Preview {
    PokemonGridView()
}
