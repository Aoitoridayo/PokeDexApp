//
//  PokemonCollectionView.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2024/03/07.
//

import SwiftUI

struct PokemonCollectionView: View {
    @StateObject var pokemonData = PokemonViewModel()
    let columnLayout = Array(repeating: GridItem(), count: 2)
        var body: some View {
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(pokemonData.pokemonList) { pokemon in
                        CollectionGrid(pokemon: pokemon)
                            .padding(10)
                    }
                }
            }
            .padding()
            .task {
                await pokemonData.getPokemons()
            }
        }
}

#Preview {
    PokemonCollectionView()
}
