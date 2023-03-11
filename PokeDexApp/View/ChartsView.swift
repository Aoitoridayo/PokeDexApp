//
//  ChartsView.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2023/03/10.


import SwiftUI
import Charts

struct ChartsView: View {
    @State var pokemon: Pokemon
    let back: () -> Void
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    AsyncImage(url: pokemon.sprites.frontImage) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                    } placeholder: {
                        ProgressView()
                    }
                    Text(pokemon.name)
                }
                Chart(pokemon.stats) { element in
                    BarMark(
                        x: .value("value", element.value),
                        y: .value("kind", element.stat.name)
                    )
                }
                .chartXScale(domain: [0, 200])
                .frame(height: 350)
                .padding([.all], 20)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            back()
                        }) {
                            Text("< back")
                        }
                    }
                }
            }
        }
    }
}

