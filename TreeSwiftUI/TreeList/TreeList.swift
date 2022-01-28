//
//  ContentView.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 07/01/2022.
//

import SwiftUI
import Foundation
import Resolver

struct TreeList: View {
    let viewModel: TreeListViewModel
    @ObservedObject var store: TreeListStore
    
    // MARK: Init
    
    init() {
        let store = TreeListStore()
        self.init(store: store, viewModel: .init(store: store))
    }
    
    init(store: TreeListStore, viewModel: TreeListViewModel) {
        self.store = store
        self.viewModel = viewModel
    }
    
    // MARK: Views
    
    var body: some View {
        NavigationView {
            List(viewModel.store.records, id: \.recordid) { item in
                NavigationLink(destination: TreeDetail(tree: item.fields)) {
                    TreeListRow(item: item.fields)
                }
            }
            .navigationTitle("Trees")
            .task {
                viewModel.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TreeList()
    }
}
