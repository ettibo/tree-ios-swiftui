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
        let completionHandler: ([Record]) -> Void = { [weak self] recordList in
            DispatchQueue.main.async {
                self?.store.records = recordList
            }
        }
        Task.init {
            await self.service.fetchTrees(completionHandler: completionHandler)
        }
    }
}
