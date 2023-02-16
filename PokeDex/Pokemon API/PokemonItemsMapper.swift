//
//  PokemonItemsMapper.swift
//  PokeDex
//
//  Created by Victor Arana on 2/16/23.
//

import Foundation

final class PokemonItemsMapper {
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemotePokemon] {
        guard response.isOK(), let items = try? JSONDecoder().decode([RemotePokemon].self, from: data) else {
            throw RemotePokemonLoader.Error.invalidData
        }
        return items
    }
}
