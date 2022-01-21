//
//  DataTransferService.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 21/01/2022.
//

import Foundation

protocol DataTransferService {
    typealias CompletionHandler<T> = (Result<T, Error>) -> Void
    func request<T: Decodable>(endpoint: Endpoint, completion: @escaping CompletionHandler<T>)
}
