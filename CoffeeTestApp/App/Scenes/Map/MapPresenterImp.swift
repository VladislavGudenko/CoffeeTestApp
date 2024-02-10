//
//  MapInteractorPresenter.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation

class MapPresenterImp: MapPresenterProtocol {
    
    var interactor: MapInputInteractorProtocol?
    var view: MapViewProtocol?
    var router: MapRouterProtocol?
    
    func viewDidLoad() {
        // nothing to do
    }
}

extension MapPresenterImp: MapOutputInteractorProtocol {
    
}
