//
//  MapProtocols.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation
import UIKit
import YandexMapsMobile

protocol MapViewProtocol: class {
    
}

protocol MapPresenterProtocol: class {
    var interactor: MapInputInteractorProtocol? { get set }
    var view: MapViewProtocol? { get set }
    var router: MapRouterProtocol? { get set }
    
    func viewDidLoad()
    
}

protocol MapInputInteractorProtocol: class {
    var presenter: MapOutputInteractorProtocol? { get set }
    
}

protocol MapOutputInteractorProtocol: class {
    
    
}

protocol MapRouterProtocol: class {
    func openOrderScreen(from view: UIViewController)
    static func createMapModule(mapRef: MapViewController, with items: [YMKPoint])
}
