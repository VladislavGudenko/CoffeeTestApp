//
//  LocationConverter.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation
import CoreLocation

class LocationConverter {
    
    static let shared = LocationConverter()
    
    var latitude: String?
    var longitude: String?
    var userLocation: CLLocationCoordinate2D?
    var locations: [LocationsEntity]?
}
