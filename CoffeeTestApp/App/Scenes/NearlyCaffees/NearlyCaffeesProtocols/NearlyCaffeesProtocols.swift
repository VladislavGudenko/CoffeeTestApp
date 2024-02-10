//
//  NearlyCaffeesProtocols.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation
import UIKit
import YandexMapsMobile

protocol NearlyCaffeesViewProtocol: class {
    func displayCaffees(_ locationsItems: [LocationsEntity], _ ymkPoints: [YMKPoint])
}

protocol NearlyCaffeesPresenterProtocol: class {
    var interactor: NearlyCaffeesInputInteractorProtocol? { get set }
    var view: NearlyCaffeesViewProtocol? { get set }
    var router: NearlyCaffeesRouterProtocol? { get set }
    
    func viewDidLoad()
    func fetchData()
    func openMapScene(with view: UIViewController, with items: [YMKPoint])
    func openMenuScene(with: UIViewController)    
}

protocol NearlyCaffeesInputInteractorProtocol: class {
    var presenter: NearlyCaffeesOutputInteractorProtocol? { get set }
    func fetchNearlyCaffeesData()
}

protocol NearlyCaffeesOutputInteractorProtocol: class {
    var response: [LocationsEntity] { get set }
    var ymkPoints: [YMKPoint] { get set }
    func nearlyCaffeesDataFetched(_ locationsItems: [LocationsEntity], ymkPoints: [YMKPoint])
    
}

protocol NearlyCaffeesRouterProtocol: class {
    static func createNearlyCaffeesModule(nearlyCaffeesRef: NearlyCaffeesViewController)
    func openOnMapScene(from view: UIViewController, with items: [YMKPoint])
    func openMenuScene(from view: UIViewController)
}

