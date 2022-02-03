//
//  TreeListStore.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 21/01/2022.
//

import Foundation

class TreeListStore: ObservableObject {
    @Published var trees = [Tree]()
}
