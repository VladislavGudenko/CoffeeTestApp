//
//  NearlyCaffees + TableView.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation
import UIKit
import CoreLocation

extension NearlyCaffeesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = response
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NearlyCaffeesTableViewCell else {
            return UITableViewCell()
        }
        if !data.isEmpty {
            print(">>>>>>>>>>>>\(data)")
            cell.setupCell(data[indexPath.row])
            
            let locations = response[indexPath.row]
            if let latitude = locations.point.latitude,
                let longitude = locations.point.longitude,
                let userLatitude = LocationConverter.shared.userLocation?.latitude,
                let userLongitude = LocationConverter.shared.userLocation?.longitude {
                let locationCoordinate = CLLocationCoordinate2D(latitude: Double(latitude) ?? 0, longitude: Double(longitude) ?? 0)
                
                let distance = calculateDistance(userLocation: LocationConverter.shared.userLocation, targetLocation: locationCoordinate)
                let distanceInKilometers = String(format: "%.2f", distance / 1000.0)
                cell.distanceLabel.text = "\(distanceInKilometers) км от вас"
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func calculateDistance(userLocation: CLLocationCoordinate2D?, targetLocation: CLLocationCoordinate2D) -> CLLocationDistance {
        guard let userLocation = userLocation else { return 0 }
        let userCLLocation = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
        let targetCLLocation = CLLocation(latitude: targetLocation.latitude, longitude: targetLocation.longitude)
        return userCLLocation.distance(from: targetCLLocation)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.openMenuScene(with: self)
    }
}
