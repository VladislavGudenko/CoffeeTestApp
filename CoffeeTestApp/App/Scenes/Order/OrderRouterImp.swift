//
//  OrderRouterImp.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation
import UIKit

class OrderRouterImp: OrderRouterProtocol {
    func openOrderScreen(from view: UIViewController) {
        // nothing to open from this VC
    }
    
    static func createMapModule(orderRef: OrderViewController, with entity: [OrderEntity]) {
        let presenter: OrderPresenterProtocol & OrderOutputInteractorProtocol = OrderPresenterImp()
        orderRef.presenter = presenter
        orderRef.presenter?.router = OrderRouterImp()
        orderRef.presenter?.view = orderRef
        orderRef.orderItems = entity
        orderRef.presenter?.interactor = OrderInteractorImp()
        orderRef.presenter?.interactor?.presenter = presenter
    }
    
    
}
