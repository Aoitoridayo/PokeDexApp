//
//  CollectionGrid.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2024/03/07.
//

import SwiftUI

struct CollectionGrid: View {
    @State var pokemon: Pokemon
    @State var isChartsView = false
    var body: some View {
        RoundedRectangle(cornerRadius: 10.0)
            .aspectRatio(1.0, contentMode: ContentMode.fit)
            .foregroundStyle(Color.blue)
            .shadow(radius: 10, x: 0, y: 5)
            .overlay {
                VStack(spacing: 0.5) {
                    Text(pokemon.name)
                        .font(.title2)
                    HStack {
                        Spacer()
                        AsyncImage(
                            url: pokemon.sprites.frontImage, scale: 1) { image in
                                image
                            } placeholder: {
                                ProgressView()
                            }
                    }
                }
            }
        .sheet(isPresented: $isChartsView) {
            ChartsView(pokemon: pokemon, back: { isChartsView = false })
        }
    }
}

struct GridPreview: View {
    static let url: URL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")!
    @State var pokemon = Pokemon(name: "フシギダネ", sprites: Sprites(frontImage: url), stats: [])
    var body: some View {
        CollectionGrid(pokemon: pokemon)
    }
}

#Preview {
    GridPreview()
}
