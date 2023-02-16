//
//  HTTPClient.swift
//  PokeDex
//
//  Created by Victor Arana on 2/16/23.
//

import Foundation

public protocol HTTPClientTask {
    func cancel()
}

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    func get(from url: URL, completion: @escaping (Result) -> Void) -> HTTPClientTask
}
