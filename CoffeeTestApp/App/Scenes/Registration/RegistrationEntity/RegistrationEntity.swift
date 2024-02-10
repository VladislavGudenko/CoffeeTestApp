//
//  RegistrationEntity.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation

struct RegistrationEntity: Codable {
    
    var token: String?
    var tokenLifetime: Int?
}
