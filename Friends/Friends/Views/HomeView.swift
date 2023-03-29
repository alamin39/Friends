//
//  HomeView.swift
//  Friends
//
//  Created by Al-Amin on 2023/03/28.
//

import SwiftUI

struct HomeView: View {
    
    private let columns = Array(repeating: GridItem(.flexible()),
                                count: 2)
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                background
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.allFriend, id: \.email) { user in
                            NavigationLink {
                                DetailView(user: user)
                            } label: {
                                PersonCardView(user: user)
                                    .accessibilityIdentifier(user.email ?? "\(UUID())")
                            }
                        }
                    }
                    .padding()
                    .accessibilityIdentifier("friendsGrid")
                }
            }
            .navigationTitle("Friends")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    private var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .top)
    }
}
