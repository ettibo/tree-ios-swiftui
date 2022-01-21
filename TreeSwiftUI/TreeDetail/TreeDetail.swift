//
//  TreeDetails.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 07/01/2022.
//

import SwiftUI

struct TreeDetail : View {
    let tree: Fields

    var body: some View {
        VStack {
            Text(tree.adresse ?? "")
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
