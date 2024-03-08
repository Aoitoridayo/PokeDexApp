//
//  CollectionGrid.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2024/03/07.
//

import SwiftUI

struct GridRow: View {
    @State var pokemon: Pokemon
    var body: some View {
        RoundedRectangle(cornerRadius: 10.0)
            .aspectRatio(1.0, contentMode: ContentMode.fit)
            .foregroundStyle(.white)
            .shadow(radius: 10, x: 0, y: 5)
            .overlay {
                VStack(spacing: 0.5) {
                    Text(pokemon.name)
                        .font(.title2)
                    HStack {
                        Spacer()
                        AsyncImage(
                            url: pokemon.imageURL,
                            scale: 1) { image in
                                image
                            } placeholder: {
                                ProgressView()
                            }
                    }
                }
            }
    }
}


#Preview {
    PokemonGridView()
}
