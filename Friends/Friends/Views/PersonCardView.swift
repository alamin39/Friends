//
//  PersonCardView.swift
//  Friends
//
//  Created by Al-Amin on 2023/03/28.
//

import SwiftUI

struct PersonCardView: View {
    
    let user: User
    
    var body: some View {
        VStack(spacing: .zero) {
            
            AsyncImage(url: .init(string: user.picture?.large ?? "")) { image in
                portrait(image: image)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                fullName
                country
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 4)
            .padding(.vertical, 4)
            .background(Theme.background)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16,
                                    style: .continuous))
        .shadow(color: Theme.text.opacity(0.4),
                radius: 2, x: 0, y: 1)
    }
}

struct PersonCardView_Previews: PreviewProvider {
    
    static var previewUser: User {
        let user = User(name: Name(first: "Al-", last: "Amin"), location: Location(street: Street(number: 0, name: ""), city: "", state: "", country: "Bangladesh"), email: "alamin61a@gmail.com", cell: "", picture: Picture(large: "https://randomuser.me/api/portraits/men/75.jpg"))
        return user
    }
    
    static var previews: some View {
        PersonCardView(user: previewUser)
            .frame(width: 250)
    }
}


extension PersonCardView {
    
    private func portrait(image: Image) -> some View {
        image
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .clipped()
    }
    
    private var fullName: some View {
        Text("\(user.name?.first ?? "") \(user.name?.last ?? "")")
            .foregroundColor(Theme.text)
            .font(.headline)
    }
    
    private var country: some View {
        Text(user.location?.country ?? "")
            .foregroundColor(Theme.text)
            .font(.subheadline)
    }
}
