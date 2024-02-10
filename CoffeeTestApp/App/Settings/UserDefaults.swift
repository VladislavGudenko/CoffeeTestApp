//
//  UserDefaults.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation

class UserDefaultsManager {
    
    static let tokenKey = "token"
    
    static func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    static func loadToken() -> String {
        return UserDefaults.standard.string(forKey: tokenKey) ?? ""
    }
}
