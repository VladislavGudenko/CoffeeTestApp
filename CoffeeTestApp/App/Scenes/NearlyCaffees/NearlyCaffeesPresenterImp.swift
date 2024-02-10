//
//  NearlyCaffeesPresenterImp.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation
import UIKit
import YandexMapsMobile

class NearlyCaffeesPresenterImp: NearlyCaffeesPresenterProtocol {
    
    var interactor: NearlyCaffeesInputInteractorProtocol?
    var view: NearlyCaffeesViewProtocol?
    var router: NearlyCaffeesRouterProtocol?
    
    var response: [LocationsEntity] = []
    var ymkPoints: [YMKPoint] = []
    
        
    func viewDidLoad() {
        self.fetchData()
    }
    
    func fetchData() {
        interactor?.fetchNearlyCaffeesData()
    }
    
    func openMapScene(with view: UIViewController, with items: [YMKPoint]) {
        router?.openOnMapScene(from: view, with: items)
        print(items)
    }
    
    func openMenuScene(with: UIViewController) {
        router?.openMenuScene(from: with)
    }
}

extension NearlyCaffeesPresenterImp: NearlyCaffeesOutputInteractorProtocol {
    
    func nearlyCaffeesDataFetched(_ locationsItems: [LocationsEntity], ymkPoints: [YMKPoint]) {
        view?.displayCaffees(locationsItems, ymkPoints)
    }
    
    
}
