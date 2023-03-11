//
//  ListRow.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/07.
//

import SwiftUI

struct ListRow: View {
    @State var pokemon: Pokemon
    @State var isChartsView = false
    var body: some View {
        HStack {
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
            Spacer()
            Button(action: {
                isChartsView = true
            }) {
                Image(systemName: "magnifyingglass")
            }
            .buttonStyle(.borderless)
        }
        .sheet(isPresented: $isChartsView) {
            ChartsView(pokemon: pokemon, back: { isChartsView = false })
        }
    }
}

struct Preview: View {
    static var url: URL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")!
    @State var pokemon = Pokemon(name: "フシギダネ", sprites: Sprites(frontImage: url), stats: [])
    var body: some View {
        ListRow(pokemon: pokemon)
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
