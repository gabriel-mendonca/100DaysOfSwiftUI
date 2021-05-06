//
//  Models.swift
//  Friends
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 30/04/21.
//

import Foundation

struct User: Codable {
    var id: String?
    var isActive: Bool?
    var name: String?
    var age: Int?
    var company: String?
    var email: String?
    var address: String?
    var about: String?
    var friends: [Friends]
}

struct Friends: Codable, Identifiable {
    var id: String
    var name: String
}
