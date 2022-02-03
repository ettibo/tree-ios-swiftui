//
//  Tree.swift
//  TreeSwiftUI
//
//  Created by Thibaud Huchon on 03/02/2022.
//

import Foundation

struct Tree {
    let id: Int
    let hauteurenm: Int
    let libellefrancais: String?
    let circonferenceencm: Int
    let espece: String?
    let genre: String?
    let adresse: String?
    let arrondissement: String?
    let varieteoucultivar: String?
    
    static let empty = Tree(id: 0,
                            hauteurenm: 0,
                            libellefrancais: nil,
                            circonferenceencm: 0,
                            espece: nil,
                            genre: nil,
                            adresse: nil,
                            arrondissement: nil,
                            varieteoucultivar: nil)
}
