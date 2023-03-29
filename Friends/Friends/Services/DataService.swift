//
//  DataService.swift
//  Friends
//
//  Created by Al-Amin on 2023/03/29.
//

import Foundation
import Combine

class DataService {
    
    @Published var allFriend: [User] = []
    private var subscription: AnyCancellable?
    
    init() {
        getAllFriendData()
    }
    
    func getAllFriendData() {
        guard let url = URL(string: "https://randomuser.me/api/?results=10") else { return }
        
        subscription = NetworkingManager.download(url: url)
            .decode(type: Friends.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedData in
                self?.allFriend = returnedData.results ?? []
                self?.subscription?.cancel()
            })
    }
}
