//
//  FriendsApp.swift
//  Friends
//
//  Created by Al-Amin on 2023/03/28.
//

import SwiftUI

@main
struct FriendsApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: ViewModel())
        }
    }
}
