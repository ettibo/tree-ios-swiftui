//
//  DataToDomain.swift
//  TreeSwiftUI
//
//  Created by Thibaud Huchon on 03/02/2022.
//

import Foundation

protocol DataToDomain {
    associatedtype M: Any
    func ToDomain() -> M
}