//
//  ContentView.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 07/01/2022.
//

import SwiftUI
import Foundation
import Resolver

struct TreeListView: View {
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
            List(viewModel.store.trees, id: \.id) { item in
                NavigationLink(destination: TreeDetailView(tree: item)) {
                    TreeListRow(tree: item)
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
        TreeListView()
    }
}
