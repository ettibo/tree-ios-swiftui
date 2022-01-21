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
        
        self.dataTransFertService.request(endpoint: treeEndpoint) { (result: Result<Welcome, Error>) in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.records))
            case .failure(let error):
                completion(.failure(error))
            }
        }
//
//        guard let url = URL(string: "https://opendata.paris.fr/api/records/1.0/search/?dataset=les-arbres&rows=20") else {
//            print("Invalid URL")
//            return
//        }
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            if let decodedResponse = try? JSONDecoder().decode(Welcome.self, from: data) {
//                completionHandler(decodedResponse.records)
//            }
//            // more code to come
//        } catch {
//            print("Invalid data")
//        }
    }
}
