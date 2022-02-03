//
//  TreeListRow.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 28/01/2022.
//

import SwiftUI

struct TreeListRow : View {
    let tree: Tree

    var body: some View {
        
        HStack {
            Image("tree")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(tree.libellefrancais ?? "")
                Text(tree.espece ?? "")
            }
        }
    }
}
