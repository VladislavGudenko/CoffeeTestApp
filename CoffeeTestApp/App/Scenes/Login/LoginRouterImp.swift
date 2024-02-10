//
//  LoginRouterImp.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation
import UIKit

class LoginRouterImp: LoginRouterProtocol {
    
    static func createLoginModule(loginRef: LoginViewController) {
        let presenter: LoginPresenterProtocol & LoginOutputInteractorProtocol = LoginPresenterImp()
        loginRef.presenter = presenter
        loginRef.presenter?.router = LoginRouterImp()
        loginRef.presenter?.view = loginRef
        loginRef.presenter?.interactor = LoginInteractorImp()
        loginRef.presenter?.interactor?.presenter = presenter
    }
    
    func openNearlyCaffeesScene(from view: UIViewController) {
        let nearlyCaffeesViewController = NearlyCaffeesViewController()
        NearlyCaffeesRouterImp.createNearlyCaffeesModule(nearlyCaffeesRef: nearlyCaffeesViewController)
        view.navigationController?.pushViewController(nearlyCaffeesViewController, animated: true)
    }
    
    
}
