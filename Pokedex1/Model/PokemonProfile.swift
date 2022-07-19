//
//  PokemonPage.swift
//  Pokedex1
//
//  Created by Raul Barranco on 7/17/22.
//

import Foundation

struct PokemonProfile: Decodable {
    
    let name: String
    let sprites: PokeSprites
    let types: [PokeTypes]
    
    let abilities: [PokeAbilities]
    let moves: [PokeMoves]
}

struct PokeSprites: Decodable {
    
    let back_default: String?
    let back_female: String?
    let back_shiny: String?
    let back_Shiny_female: String?
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
    
}

struct PokeTypes: Decodable {
    
    let type: PokeType
    
}

struct PokeType: Decodable {
    
    let name: String
    
}

struct PokeAbilities: Decodable {
    
    let ability: PokeAbility
}

struct PokeAbility: Decodable {
    
    let name: String
    
}

struct PokeMoves: Decodable {
    
    let move: PokeMove
    
}

struct PokeMove: Decodable {
    
    let name: String
}

