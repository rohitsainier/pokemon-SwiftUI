//
//  PokemonCell.swift
//  PokemonSwiftUI
//
//  Created by Rohit Saini on 04/07/21.
//

import SwiftUI
import Kingfisher
struct PokemonCell: View {
    let pokemon:Pokemon
    let viewModel :PokemonViewModel
    let backgroundColor: Color
    init(pokemon:Pokemon,viewModel:PokemonViewModel){
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroundColor = Color(viewModel.pokemonColor(forType: pokemon.type))
    }
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top,4)
                    .padding(.leading)
                
                HStack{
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal,16)
                        .padding(.vertical,8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 65, height: 65)
                        .padding([.bottom,.trailing],4)
                }
            }
        }
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(color: backgroundColor, radius: 6, x: 0, y: 0)
    }
}

