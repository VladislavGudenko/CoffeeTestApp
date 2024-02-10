//
//  OrderPresenterImp.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation

class OrderPresenterImp: OrderPresenterProtocol {
    
    var interactor: OrderInputInteractorProtocol?
    var view: OrderViewProtocol?
    var router: OrderRouterProtocol?
    
    func viewDidLoad() {
        //
    }
    
    
}

extension OrderPresenterImp: OrderOutputInteractorProtocol {
    
}
