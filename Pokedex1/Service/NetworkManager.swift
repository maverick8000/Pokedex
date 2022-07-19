//
//  NetworkManager.swift
//  Pokedex1
//
//  Created by Raul Barranco on 7/17/22.
//

import Foundation
import UIKit

class NetworkManager {
    
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        
        self.session = session
    }
    
    
}

extension NetworkManager {
    
    func fetchPage(urlStr: String, completion: @escaping (Result<PokemonProfile, Error>) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            //completion error
            return
        }
        
        self.session.dataTask(with: url) { data, response, error in
            
            // Do error handling
            
            guard let data = data else {
                //return error
                return
            }
            
            do {
                let page = try JSONDecoder().decode(PokemonProfile.self, from: data)
                completion(.success(page))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()

    }
    
    func fetchPage2(urlStr: String, completion: @escaping (Result<PokemonName, Error>) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            //completion error
            return
        }
        
        self.session.dataTask(with: url) { data, response, error in
            
            // Do error handling
            
            guard let data = data else {
                //return error
                return
            }
            
            do {
                let page = try JSONDecoder().decode(PokemonName.self, from: data)
                completion(.success(page))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()

    }
    
    func fetchImage(urlStr: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            //completion error
            return
        }
        
        self.session.dataTask(with: url) { data, response, error in
            
            // Do error handling
            
            guard let data = data else {
                //return error
                return
            }
            
            completion(.success(data))
            
        }.resume()

    }
    
}
