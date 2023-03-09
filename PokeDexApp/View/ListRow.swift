//
//  ListRow.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/07.
//

import SwiftUI

struct ListRow: View {
    @State var pokemon: Pokemon
    var body: some View {
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
