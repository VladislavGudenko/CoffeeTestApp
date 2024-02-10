//
//  OrderProtocols.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation
import UIKit

protocol OrderViewProtocol: class {
    
}

protocol OrderPresenterProtocol: class {
    var interactor: OrderInputInteractorProtocol? { get set }
    var view: OrderViewProtocol? { get set }
    var router: OrderRouterProtocol? { get set }
    
    func viewDidLoad()
    
}

protocol OrderInputInteractorProtocol: class {
    var presenter: OrderOutputInteractorProtocol? { get set }
    
}

protocol OrderOutputInteractorProtocol: class {
    
    
}

protocol OrderRouterProtocol: class {
    func openOrderScreen(from view: UIViewController)
    static func createMapModule(orderRef: OrderViewController, with entity: [OrderEntity])
}
