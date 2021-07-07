//
//  Pokemon.swift
//  PokemonSwiftUI
//
//  Created by Rohit Saini on 04/07/21.
//

import Foundation

struct Pokemon:Decodable,Identifiable{
    let id: Int
    let name:String
    let imageUrl:String
    let type:String
}
