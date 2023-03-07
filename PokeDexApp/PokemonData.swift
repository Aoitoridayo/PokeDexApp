
import Foundation

class PokemonData: ObservableObject {
    
    struct Item: Decodable {
        let name: String?
        let sprites: Sprites?
    }
    @Published var pokemonList: [Pokemon] = []
    
    func onAppear() {
        let urls = getURLs()
        Task {
            await fetchPokemonData(urls: urls)
        }
    }
    
    private func fetchPokemonData(urls: [String]) async {
        for url in urls {
            await getPokemon(url: url)
        }
    }
    
    @MainActor
    private func getPokemon(url: String) async {
        guard let reqestURL = URL(string: url) else {
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: reqestURL)
            let item = try JSONDecoder().decode(Item.self, from: data)
            
            if let name = item.name, let sprites = item.sprites {
                let pokemon = Pokemon(name: name, sprites: sprites)
                pokemonList.append(pokemon)
            }
            
        } catch {
            print("エラー")
        }
    }
    
    //ポケモン151体分のリクエストURL作成メソッド
    private func getURLs() -> [String] {
        let pokemonIdRange = 1...151
        let url: [String] = pokemonIdRange.map {
            "https://pokeapi.co/api/v2/pokemon/\($0)/"
        }
        return url
    }
}
