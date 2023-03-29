//
//  ViewModel.swift
//  Friends
//
//  Created by Al-Amin on 2023/03/29.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var allFriend: [User] = []
    private var dataService = DataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    private func addSubscriber() {
        // updates friends info
        dataService.$allFriend
            .sink { [weak self] returnedData in
                self?.allFriend = returnedData
            }
            .store(in: &cancellables)
    }
}
