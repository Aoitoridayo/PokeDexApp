//
//  PokemonType.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2024/03/07.
//

import Foundation
import SwiftUI

enum PokemonType {
    case fire
    case water
    case grass
    case electric
    case normal
    case psychic
    case fighting
    case flying
    case bug
    case poison
    case ground
    case rock
    case ghost
    case ice
    case dragon
    case steel
    case fairy
    case dark
    
    init(type: String) {
        switch type {
        case "fire":
            self = .fire
        case "water":
            self = .water
        case "grass":
            self = .grass
        case "electric":
            self = .electric
        case "normal":
            self = .normal
        case "psychic":
            self = .psychic
        case "fighting":
            self = .fighting
        case "flying":
            self = .flying
        case "bug":
            self = .bug
        case "poison":
            self = .poison
        case "ground":
            self = .ground
        case "rock":
            self = .rock
        case "ghost":
            self = .ghost
        case "ice":
            self = .ice
        case "dragon":
            self = .dragon
        case "steel":
            self = .steel
        case "fairy":
            self = .fairy
        case "dark":
            self = .dark
        default:
            self = .normal
        }
    }
    
    var title: String {
        switch self {
        case .fire:
            return "ほのお"
        case .water:
            return "みず"
        case .grass:
            return "くさ"
        case .electric:
            return "でんき"
        case .normal:
            return "ノーマル"
        case .psychic:
            return "エスパー"
        case .fighting:
            return "かくとう"
        case .flying:
            return "ひこう"
        case .bug:
            return "むし"
        case .poison:
            return "どく"
        case .ground:
            return "じめん"
        case .rock:
            return "いわ"
        case .ghost:
            return "ゴースト"
        case .ice:
            return "こおり"
        case .dragon:
            return "ドラゴン"
        case .steel:
            return "はがね"
        case .fairy:
            return "フェアリー"
        case .dark:
            return "あく"
        }
    }
    
    var color: Color {
        switch self {
        case .fire:
            return .red
        case .water:
            return .blue
        case .grass:
            return .green
        case .electric:
            return .yellow
        case .normal:
            return .gray
        case .psychic:
            return .pink
        case .fighting:
            return .orange
        case .flying:
            return .cyan
        case .bug:
            return .indigo
        case .poison:
            return .purple
        case .ground:
            return .brown
        case .rock:
            return .orange
        case .ghost:
            return .purple
        case .ice:
            return .mint
        case .dragon:
            return .indigo
        case .steel:
            return .gray
        case .fairy:
            return .pink
        case .dark:
            return .gray
        }
    }
}
