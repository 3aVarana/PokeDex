//
//  HTTPClientResponse+StatusCode.swift
//  PokeDex
//
//  Created by Victor Arana on 2/16/23.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { 200 }
    
    func isOK() -> Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
