//
//  PokemonViewModel.swift
//  PokemonSwiftUI
//
//  Created by Rohit Saini on 05/07/21.
//

import Foundation
import SwiftUI

protocol PokemonProtocol{
    func fetchPokemon()
    func pokemonColor(forType type: String) -> UIColor
}

class PokemonViewModel:ObservableObject,PokemonProtocol{
    func pokemonColor(forType type: String) -> UIColor {
        switch type{
        case "fire": return .systemRed
        case "poison": return .systemGreen
        case "water": return .systemTeal
        case "electric": return .systemYellow
        case "normal": return .systemOrange
        case "psychic": return .systemPurple
        case "ground": return .systemGray
        case "flying": return .systemBlue
        case "fairy": return .systemPink
        default:
            return .systemIndigo
        }
    }
    
    
    
    @Published var pokemon = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init(){
        fetchPokemon()
    }
    
    func fetchPokemon() {
        guard let url = URL(string: baseUrl) else{ return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data?.parseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else {return}
                    DispatchQueue.main.async {
                        self.pokemon = pokemon
                    }
        }.resume()
    }
}

extension Data{
    func parseData(removeString string: String) -> Data?{
        let dataAsString = String(data:self,encoding:.utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil}
        return data
    }
}
