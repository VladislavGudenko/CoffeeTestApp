//
//  LocationManager.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 07.02.2024.
//

import Foundation
import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
        
//    weak var delegate: MainView?
    
    var locationManager = CLLocationManager()
    var geocoder = CLGeocoder()
    
    func activateLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locationCity = locations.last {
            geocoder.reverseGeocodeLocation(locationCity) { (placemarks, error) in
                if let placemark = placemarks?.first {
                    if let city = placemark.locality {
                        print("City is \(city)")
                    }
                }
            }
        }
        guard let userCoordinate = locations.last?.coordinate else { return }
        LocationConverter.shared.userLocation = userCoordinate
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
//            delegate?.setupCoordinates(latitude: latitude, longitude: longitude)
            print(latitude)
            print(longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error to request location")
    }
}


