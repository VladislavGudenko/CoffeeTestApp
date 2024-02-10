//
//  Protocols.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 08.02.2024.
//

import Foundation
import UIKit

protocol MenuViewProtocol: class {
    func displayMenu(_ menuItems: [MenuEntity])
}

protocol MenuPresenterProtocol: class {
    var interactor: MenuInputInteractorProtocol? { get set }
    var view: MenuViewProtocol? { get set }
    var router: MenuRouterProtocol? { get set }
    
    func viewDidLoad()
    func openOrderScene(from view: UIViewController, with entity: [OrderEntity])
}

protocol MenuInputInteractorProtocol: class {
    var presenter: MenuOutputInteractorProtocol? { get set }
    func fetchMenu()
}

protocol MenuOutputInteractorProtocol: class {
    func menuFetched(_ menuItems: [MenuEntity])
    
}

protocol MenuRouterProtocol: class {
    func openOrderScreen(from view: UIViewController, with entity: [OrderEntity])
    static func createMenuModule(menuRef: MenuViewController)
}
