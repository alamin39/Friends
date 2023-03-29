//
//  DetailView.swift
//  Friends
//
//  Created by Al-Amin on 2023/03/28.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        ZStack {
            background
            ScrollView {
                VStack(spacing: 12) {
                    portrait
                    general
                }
                .padding()
            }
        }
        .navigationTitle("Details")
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static var previewUser: User {
        let user = User(name: Name(first: "Al-", last: "Amin"),
                        location: Location(street: Street(number: 2, name: "Not found"),city: "Kawasaki",state: "Tokyo",country: "Japan"),
                        email: "alamin61a@gmail.com",
                        cell: "(489) 330-2385",
                        picture: Picture(large: "https://randomuser.me/api/portraits/men/75.jpg"))
        return user
    }
    
    static var previews: some View {
        DetailView(user: previewUser)
            .frame(width: 300)
    }
}

extension DetailView {
    
    private var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .top)
    }
    
    private var portrait: some View {
        VStack(alignment: .center) {
            if let avatarAbsoluteString = user.picture?.large,
               let avatarUrl = URL(string: avatarAbsoluteString) {
                AsyncImage(url: avatarUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
                .clipShape(RoundedRectangle(cornerRadius: 16,
                                            style: .continuous))
            }
        }
    }
    
    private var general: some View {
        VStack(alignment: .leading) {
            fullName
            Divider()
            address
            Divider()
            cityStateCountry
            Divider()
            email
            Divider()
            cellPhone
            Divider()
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
        .background(Theme.detailBackground, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
    
    private var fullName: some View {
        VStack(alignment: .leading) {
            Text("Full Name")
                .foregroundColor(Theme.text)
                .font(.title3)
                .bold()
            Text("\(user.name?.first ?? "") \(user.name?.last ?? "")")
                .foregroundColor(Theme.text)
                .font(.title3)
        }
    }
    
    private var address: some View {
        VStack(alignment: .leading) {
            Text("Address")
                .foregroundColor(Theme.text)
                .font(.title3)
                .bold()
            Text("\(user.location?.street?.number ?? 2), \(user.location?.street?.name ?? "Not found")")
                .foregroundColor(Theme.text)
                .font(.title3)
        }
    }
    
    private var cityStateCountry: some View {
        VStack(alignment: .leading) {
            Text("City, State and Country")
                .foregroundColor(Theme.text)
                .font(.title3)
                .bold()
            Text("\(user.location?.city ?? ""), \(user.location?.state ?? ""), \(user.location?.country ?? "")")
                .foregroundColor(Theme.text)
                .font(.title3)
        }
    }
    
    /// Need real device to send email, will not work in simulator
    private var email: some View {
        VStack(alignment: .leading) {
            Text("Email")
                .foregroundColor(Theme.text)
                .font(.title3)
                .bold()
            if let mail = user.email {
                Link(mail, destination: URL(string: "mailto:\(mail)")!)
            }
            else {
                Text("No email address")
                    .foregroundColor(Theme.text)
                    .font(.title3)
            }
        }
    }
    
    private var cellPhone: some View {
        VStack(alignment: .leading) {
            Text("Cell phone")
                .foregroundColor(Theme.text)
                .font(.title3)
                .bold()
            Text(user.cell ?? "No cell phone")
                .foregroundColor(Theme.text)
                .font(.title3)
        }
    }
}
