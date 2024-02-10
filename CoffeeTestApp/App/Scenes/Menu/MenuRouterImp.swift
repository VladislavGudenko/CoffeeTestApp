//
//  MenuRouterImp.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 08.02.2024.
//

import Foundation
import UIKit

class MenuRouterImp: MenuRouterProtocol {
    
    func openOrderScreen(from view: UIViewController, with entity: [OrderEntity]) {
        let orderViewController = OrderViewController()
        OrderRouterImp.createMapModule(orderRef: orderViewController, with: entity)
        view.navigationController?.pushViewController(orderViewController, animated: true)
    }
    
    class func createMenuModule(menuRef: MenuViewController) {
        let presenter: MenuPresenterProtocol & MenuOutputInteractorProtocol = MenuPresenterImp()
        menuRef.presenter = presenter
        menuRef.presenter?.router = MenuRouterImp()
        menuRef.presenter?.view = menuRef
        menuRef.presenter?.interactor = MenuInteractorImp()
        menuRef.presenter?.interactor?.presenter = presenter
    }
}
