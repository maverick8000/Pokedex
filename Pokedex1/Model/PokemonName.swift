//
//  PokemonName.swift
//  Pokedex1
//
//  Created by Raul Barranco on 7/17/22.
//

import Foundation


struct PokemonName: Decodable{
    let results: [ResultsName]
}


struct ResultsName: Decodable {
    let name: String

}
