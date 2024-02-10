//
//  LoginProtocols.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation
import UIKit

protocol LoginViewProtocol: class {
    
}

protocol LoginPresenterProtocol: class {
    var interactor: LoginInputInteractorProtocol? { get set }
    var view: LoginViewProtocol? { get set }
    var router: LoginRouterProtocol? { get set }
    
    var login: String? { get set }
    var password: String? { get set }
    
    func viewDidLoad()
    func fetchData(from: UIViewController)
    func openLoginScene(with: UIViewController)
    
}

protocol LoginInputInteractorProtocol: class {
    var presenter: LoginOutputInteractorProtocol? { get set }
    func fetchUserData(login: String, password: String, from: UIViewController)
}

protocol LoginOutputInteractorProtocol: class {
    var settings: Settings { get set }
    func userDataFetched(_ registrationItems: RegistrationEntity, from: UIViewController)
    
}

protocol LoginRouterProtocol: class {
    static func createLoginModule(loginRef: LoginViewController)
    func openNearlyCaffeesScene(from view: UIViewController)
}

