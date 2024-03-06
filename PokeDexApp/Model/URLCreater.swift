//
//  URLCreater.swift
//  PokeDexApp
//
//  Created by 渡邊魁優 on 2024/03/06.
//

import Foundation

class URLCreater {
    public func createURL(number: Int) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "pokeapi.co"
        components.path = "/api/v2/pokemon/\(number)"
        return components
    }
}
