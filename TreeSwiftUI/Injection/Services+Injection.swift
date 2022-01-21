//
//  Services+Injection.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 21/01/2022.
//

import Foundation

import Resolver

extension Resolver {
    public static func registerServices() {
        registerTreeListService()
    }
    
    public static func registerTreeListService() {
        register { TreeListService() }
    }
}
