//
//  PokemonLoader.swift
//  PokeDex
//
//  Created by Victor Arana on 2/16/23.
//

import Foundation

protocol PokemonLoader {
    typealias Result = Swift.Result<[Pokemon], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
