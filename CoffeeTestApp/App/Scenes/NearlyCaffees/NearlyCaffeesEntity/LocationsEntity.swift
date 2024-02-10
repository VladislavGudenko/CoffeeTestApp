//
//  LocationsEntity.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation

struct LocationsEntity: Codable {
    var id: Int?
    var name: String?
    var point: Point
}

struct Point: Codable {
    var latitude: String?
    var longitude: String?
}
