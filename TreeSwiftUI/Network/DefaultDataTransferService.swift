//
//  DefaultDataTransferService.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 21/01/2022.
//

import Foundation
import Resolver

final class DefaultDataTransferService: DataTransferService {

    @Injected var networkService: NetworkService

    func request<T: Decodable>(endpoint: Endpoint, completion: @escaping CompletionHandler<T>) {
        self.networkService.request(from: endpoint) { result in
            switch result {
            case .success(let data):
                let result: Result<T, Error> = self.decode(type: T.self, data: data, decoder: JSONResponseDecoder() )
                completion(result)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Private
    
    private func decode<T: Decodable>(type: T.Type, data: Data?, decoder: ResponseDecoder) -> Result<T, Error> {
        do {
            guard let data = data else {
                let error = NSError()
                return .failure(error)
            }
            let result: T = try decoder.decode(type: type, data)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
