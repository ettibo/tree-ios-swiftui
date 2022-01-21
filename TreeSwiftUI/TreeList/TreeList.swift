//
//  ContentView.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 07/01/2022.
//

import SwiftUI
import Foundation

struct TreeList: View {
    @EnvironmentObject var interactor: TreeListViewModel
    
    // MARK: Views
    
    var body: some View {
        NavigationView {
            List(interactor.records, id: \.recordid) { item in
                NavigationLink(destination: TreeDetail(tree: item.fields)) {
                    Text(item.fields.libellefrancais ?? "")
                }
            }
            .navigationTitle("Trees")
            .task {
                interactor.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TreeList()
    }
}
