//
//  NetworkService.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 21/01/2022.
//

import Foundation

protocol NetworkService {
    typealias CompletionHandler = (Result<Data?, Error>) -> Void
    func request(from: Endpoint, completion: @escaping CompletionHandler)
}

final class DefaultNetworkService: NetworkService {
    func request(from: Endpoint, completion: @escaping CompletionHandler) {
        guard let url = URL(string: from.path) else {
            
            return
        }
        let request = createRequest(from: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createRequest(from url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringCacheData
        return request
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping CompletionHandler) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            if let requestError = error {
                completion(.failure(requestError))
                return
            }
            completion(.success(data))
        }
    }
}
