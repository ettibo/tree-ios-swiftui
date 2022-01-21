//
//  TreeSwiftUIApp.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 07/01/2022.
//

import SwiftUI

@main
struct TreeSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            TreeList().environmentObject(TreeListViewModel())
        }
    }
}
