//
//  AppDelegate+Injection.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 21/01/2022.
//

import Foundation


import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerServices()
    }
}
