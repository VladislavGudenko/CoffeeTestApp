//
//  Settings.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation

class Settings {
    
    private var cachedAuthToken: String?
    
    var authToken: String? {
        get {
            if self.cachedAuthToken == nil {
                self.cachedAuthToken = UserDefaultsManager.loadToken()
            }
            return self.cachedAuthToken
        } set(value) {
            self.cachedAuthToken = value
            print("authToken: \(String(describing: cachedAuthToken?.description))")
            UserDefaultsManager.saveToken(value ?? "")
        }
    }
}
