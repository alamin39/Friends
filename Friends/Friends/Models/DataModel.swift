//
//  DataModel.swift
//  Friends
//
//  Created by Al-Amin on 2023/03/29.
//

import Foundation

struct Friends: Codable {
    let results: [User]?
}

struct User: Codable {
    let name: Name?
    let location: Location?
    let email: String?
    let cell: String?
    let picture: Picture?
}

struct Location: Codable {
    let street: Street?
    let city, state, country: String?
}

struct Street: Codable {
    let number: Int?
    let name: String?
}

struct Name: Codable {
    let first, last: String?
}

struct Picture: Codable {
    let large: String?
}
