//
//  TreeDetails.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 07/01/2022.
//

import SwiftUI

struct TreeDetailView : View {
    let tree: Tree

    var body: some View {
        VStack {
            Text(tree.adresse ?? "").accessibilityIdentifier("plop")
            Text(tree.espece ?? "")
            Text(tree.arrondissement ?? "")
            Text(tree.genre ?? "")
            Text("\(tree.circonferenceencm) cms")
            Text("\(tree.hauteurenm) m")
        }
        .navigationTitle(tree.libellefrancais ?? "")
    }
}

struct TreeDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            
        }
    }
}
