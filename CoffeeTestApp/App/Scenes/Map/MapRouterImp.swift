//
//  MapInteractorRouter.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation
import UIKit
import YandexMapsMobile

class MapRouterImp: MapRouterProtocol {
    
    func openOrderScreen(from view: UIViewController) {
        // nothing to route
    }
    
    class func createMapModule(mapRef: MapViewController, with items: [YMKPoint]) {
        let presenter: MapPresenterProtocol & MapOutputInteractorProtocol = MapPresenterImp()
        mapRef.presenter = presenter
        mapRef.presenter?.router = MapRouterImp()
        mapRef.presenter?.view = mapRef
        mapRef.points = items
        mapRef.presenter?.interactor = MapInteractorImp()
        mapRef.presenter?.interactor?.presenter = presenter
    }
}
