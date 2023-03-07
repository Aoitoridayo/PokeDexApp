//
//  ContentView.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/07.
//

import SwiftUI

struct ContentView: View {
    @StateObject var pokemonListData = PokemonData()
    var body: some View {
        NavigationStack {
            List {
                ForEach(pokemonListData.pokemonList) { pokemon in
                    HStack {
                        AsyncImage(url: pokemon.sprites.frontImage) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                        } placeholder: {
                            ProgressView()
                        }
                        Text(pokemon.name)
                    }
                }
            }
            .onAppear(perform: pokemonListData.onAppear)
            .navigationTitle("初代ポケモン")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
