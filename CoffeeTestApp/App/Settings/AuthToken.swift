//
//  AuthToken.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation

class AuthToken: Codable {

    let token: String
    var description: String {
        ("AuthToken (token: \(token))")
    }

    init(token: String) {
        self.token = token
    }
}
