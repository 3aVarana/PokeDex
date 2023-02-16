//
//  HTTPClientSpy.swift
//  PokeDexTests
//
//  Created by Victor Arana on 2/16/23.
//

import Foundation
import PokeDex

class HTTPClientSpy: HTTPClient {
    private struct Task: HTTPClientTask {
        let callback: () -> Void
        func cancel() {
            callback()
        }
    }
    
    private var messages = [(url: URL, completion: (HTTPClient.Result) -> Void)]()
    private (set) var cancellableURLs = [URL]()
    
    var requestedURLs: [URL] {
        messages.map { $0.url }
    }
    
    func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) -> PokeDex.HTTPClientTask {
        messages.append((url, completion))
        return Task { [weak self] in
            self?.cancellableURLs.append(url)
        }
    }
    
    func complete(with error: Error, at index: Int = 0) {
        messages[index].completion(.failure(error))
    }
    
    func complete(withStatusCode code: Int, data: Data, at index: Int = 0) {
        let response = HTTPURLResponse(
            url: requestedURLs[index],
            statusCode: code,
            httpVersion: nil,
            headerFields: nil
        )!
        messages[index].completion(.success((data, response)))
    }
    
}

