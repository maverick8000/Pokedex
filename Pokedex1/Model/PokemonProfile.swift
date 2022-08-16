//
//  PokemonPage.swift
//  Pokedex1
//
//  Created by Raul Barranco on 7/17/22.
//

import Foundation

struct PokemonProfile: Decodable {
    
    let abilities: [Abilities]
    let moves: [Moves]
    let types: [PokeTypes]

}

struct Abilities: Decodable {
    
    let ability: AbilitiesArrElement
}

struct AbilitiesArrElement: Decodable {
    
    let name: String
    
}

struct Moves: Decodable {
    
    let move: MovesArrElement
    
}

struct MovesArrElement: Decodable {
    
    let name: String
}

struct PokeTypes: Decodable {
    
    let type: PokeTypesArrElement
    
}

struct PokeTypesArrElement: Decodable {
    
    let name: String
    
}
