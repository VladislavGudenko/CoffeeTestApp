//
//  LoginPresenterImp.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation
import UIKit

class LoginPresenterImp: LoginPresenterProtocol {
    
    var interactor: LoginInputInteractorProtocol?
    var view: LoginViewProtocol?
    var router: LoginRouterProtocol?
    
    var login: String?
    var password: String?
    
    var settings = Settings()
    
    func viewDidLoad() {
        // nothing to do
    }
    
    func fetchData(from: UIViewController) {
        interactor?.fetchUserData(login: login ?? "", password: password ?? "", from: from)
    }
    
    func openLoginScene(with: UIViewController) {
        router?.openNearlyCaffeesScene(from: with)
    }
    
    
}

extension LoginPresenterImp: LoginOutputInteractorProtocol {
    
    func userDataFetched(_ registrationItems: RegistrationEntity, from: UIViewController) {
        openLoginScene(with: from)
    }
    
    
}
