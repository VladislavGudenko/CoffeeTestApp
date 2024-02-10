//
//  RegistrationRouterImp.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 08.02.2024.
//

import Foundation
import UIKit

class RegistrationRouterImp: RegistrationRouterProtocol {
    
    func openLoginScene(from view: UIViewController) {
        let loginViewController = LoginViewController()
        LoginRouterImp.createLoginModule(loginRef: loginViewController)
        view.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    static func createMenuModule(regRef: RegistrationViewController) {
        let presenter: RegistrationPresenterProtocol & RegistrationOutputInteractorProtocol = RegistrationPresenterImp()
        regRef.presenter = presenter
        regRef.presenter?.router = RegistrationRouterImp()
        regRef.presenter?.view = regRef
        regRef.presenter?.interactor = RegistrationInteractorImp()
        regRef.presenter?.interactor?.presenter = presenter
    }
}
