//
//  NearlyCaffeesInteractorImp.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation
import YandexMapsMobile

class NearlyCaffeesInteractorImp: NearlyCaffeesInputInteractorProtocol {
    
    var presenter: NearlyCaffeesOutputInteractorProtocol?
    
    func fetchNearlyCaffeesData() {
        RequestManager.request(requestType: .locations) { [weak self] (result: Result<[LocationsEntity], Error>) in
            DispatchQueue.main.async {
                
                switch result {
                case let .success(data):
                    for location in data {
                        if let latitudeString = location.point.latitude,
                           let longitudeString = location.point.longitude,
                           let latitude = Double(latitudeString),
                           let longitude = Double(longitudeString) {
                            let ymkPoint = YMKPoint(latitude: latitude, longitude: longitude)
                            self?.presenter?.ymkPoints.append(ymkPoint)
                        }
                    }
                    LocationConverter.shared.locations = data
                    print(data)
                    data.forEach { item in
                        self?.presenter?.response.append(item)
                    }
                    self?.presenter?.nearlyCaffeesDataFetched(data, ymkPoints: self?.presenter?.ymkPoints ?? [])
                case let .failure(error):
                    print(error)
                }
                
            }
        }
    }
}
