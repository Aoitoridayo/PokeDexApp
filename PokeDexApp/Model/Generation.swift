//
//  Generation.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2024/03/06.
//

import Foundation

enum Generation {
    case Frist
    case Second
    case Third
    case Fourth
    case Fifth
    case Sixth
    case Seventh
    case Eighth
    case Ninth
    
    var numbers: ClosedRange<Int> {
        switch self {
        case .Frist:
            return 1...151
        case .Second:
            return 152...251
        case .Third:
            return 252...386
        case .Fourth:
            return 387...493
        case .Fifth:
            return 494...649
        case .Sixth:
            return 650...721
        case .Seventh:
            return 722...809
        case .Eighth:
            return 810...905
        case .Ninth:
            return 906...1025
        }
    }
}
