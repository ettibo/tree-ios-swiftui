//
//  JSONResponseDecoder.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 21/01/2022.
//

import Foundation

protocol ResponseDecoder {
    func decode<T: Decodable>(type: T.Type, _ data: Data) throws -> T
}

public class JSONResponseDecoder: ResponseDecoder {
    private let jsonDecoder = JSONDecoder()
    public init() { }
    public func decode<T: Decodable>(type: T.Type, _ data: Data) throws -> T {
        return try jsonDecoder.decode(type, from: data)
    }
}
