//
//  NearlyCaffeesRouterImp.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation
import UIKit
import YandexMapsMobile

class NearlyCaffeesRouterImp: NearlyCaffeesRouterProtocol {
    
    static func createNearlyCaffeesModule(nearlyCaffeesRef: NearlyCaffeesViewController) {
        let presenter: NearlyCaffeesPresenterProtocol & NearlyCaffeesOutputInteractorProtocol = NearlyCaffeesPresenterImp()
        nearlyCaffeesRef.presenter = presenter
        nearlyCaffeesRef.presenter?.router = NearlyCaffeesRouterImp()
        nearlyCaffeesRef.presenter?.view = nearlyCaffeesRef
        nearlyCaffeesRef.presenter?.interactor = NearlyCaffeesInteractorImp()
        nearlyCaffeesRef.presenter?.interactor?.presenter = presenter
    }
    
    func openOnMapScene(from view: UIViewController, with items: [YMKPoint]) {
        let mapViewController = MapViewController()
        // tut configuriruem MAP VIEW s Items
        MapRouterImp.createMapModule(mapRef: mapViewController, with: items)
        print(items)
        view.navigationController?.pushViewController(mapViewController, animated: true)
    }
    
    func openMenuScene(from view: UIViewController) {
        let menuViewCotroller = MenuViewController()
        MenuRouterImp.createMenuModule(menuRef: menuViewCotroller)
        view.navigationController?.pushViewController(menuViewCotroller, animated: true)
    }
    
}
