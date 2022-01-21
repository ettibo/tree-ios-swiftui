//
//  TreeListWorker.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 07/01/2022.
//

import Foundation
import Resolver


class TreeListService {
    struct TreeEndpoint: Endpoint {
        var path: String {
            return "https://opendata.paris.fr/api/records/1.0/search/?dataset=les-arbres&rows=20"
        }
    }
    
    @Injected var dataTransFertService: DataTransferService
    
    
    func fetchTrees(completion: @escaping (Result<[Record], Error>) -> Void) async {
        let treeEndpoint = TreeEndpoint()
        
        dataTransFertService.request(endpoint: treeEndpoint) { (result: Result<Welcome, Error>) in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.records))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
