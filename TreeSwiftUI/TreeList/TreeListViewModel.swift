//
//  TreeListInteractor.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 07/01/2022.
//

import Foundation
import Resolver

class TreeListViewModel {
    @Injected var service: TreeListService
    var store: TreeListStore
    
    // MARK: Init
    
    init(store: TreeListStore) {
        self.store = store
    }
    
    // MARK: Fetch
    
    func fetchData() {
        let completionHandler: (Result<[Record], Error>) -> Void = { [weak self] res in
            DispatchQueue.main.async {
                if case let .success(listTree) = res {
                    self?.store.trees = listTree.map { $0.fields.ToDomain() as? Tree ?? Tree.empty }
                }
            }
        }
        Task.init {
            await self.service.fetchTrees(completion: completionHandler)
        }
    }
}
