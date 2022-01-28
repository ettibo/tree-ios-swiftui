//
//  TreeListRow.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 28/01/2022.
//

import SwiftUI

struct TreeListRow : View {
    let item: Fields

    var body: some View {
        
        HStack {
            Image("tree")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(item.libellefrancais ?? "")
                Text(item.espece ?? "")
            }
        }
    }
}
