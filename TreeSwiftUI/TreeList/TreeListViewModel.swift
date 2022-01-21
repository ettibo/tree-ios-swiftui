//
//  TreeListInteractor.swift
//  TreeSwiftUI
//
//  Created by Thibaud HUCHON on 07/01/2022.
//

import Foundation

class TreeListViewModel: ObservableObject {
    private let worker = TreeListService()
    
    @Published var records = [Record]()
    
    func fetchData() {
        let completionHandler: ([Record]) -> Void = { [weak self] recordList in
            DispatchQueue.main.async {
                self?.records = recordList
            }
        }
        Task.init {
            await self.worker.fetchTrees(completionHandler: completionHandler)
        }
    }
}
