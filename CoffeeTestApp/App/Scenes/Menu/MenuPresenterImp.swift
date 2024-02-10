//
//  MenuPresenterImp.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 08.02.2024.
//

import Foundation
import UIKit

class MenuPresenterImp: MenuPresenterProtocol {
    
    var interactor: MenuInputInteractorProtocol?
    weak var view: MenuViewProtocol?
    var router: MenuRouterProtocol?
    
    func viewDidLoad() {
        self.fetchMenu()
    }
    
    func fetchMenu() {
        interactor?.fetchMenu()
    }
    
    func menuFetched(_ menuItems: [MenuEntity]) {
        view?.displayMenu(menuItems)
    }
}

extension MenuPresenterImp: MenuOutputInteractorProtocol {
    
    func openOrderScene(from view: UIViewController, with entity: [OrderEntity]) {
        router?.openOrderScreen(from: view, with: entity)
    }
}
