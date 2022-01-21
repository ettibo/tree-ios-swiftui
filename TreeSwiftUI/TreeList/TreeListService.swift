//
//  TreeListWorker.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 07/01/2022.
//

import Foundation

class TreeListService {
    func fetchTrees(completionHandler: @escaping ([Record]) -> Void) async {
        guard let url = URL(string: "https://opendata.paris.fr/api/records/1.0/search/?dataset=les-arbres&rows=20") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Welcome.self, from: data) {
                completionHandler(decodedResponse.records)
            }
            // more code to come
        } catch {
            print("Invalid data")
        }
    }
}
