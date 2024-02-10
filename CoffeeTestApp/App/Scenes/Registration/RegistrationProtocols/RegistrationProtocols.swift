//
//  RegistrationProtocols.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 08.02.2024.
//

import Foundation
import UIKit

protocol RegistrationViewProtocol: class {
    
}

protocol RegistrationPresenterProtocol: class {
    var interactor: RegistrationInputInteractorProtocol? { get set }
    var view: RegistrationViewProtocol? { get set }
    var router: RegistrationRouterProtocol? { get set }
    
    var login: String? { get set }
    var password: String? { get set }
    
    func viewDidLoad()
    func fetchData(from: UIViewController)
    func openLoginScene(with: UIViewController)
    
}

protocol RegistrationInputInteractorProtocol: class {
    var presenter: RegistrationOutputInteractorProtocol? { get set }
    func fetchUserData(login: String, password: String, from: UIViewController)
}

protocol RegistrationOutputInteractorProtocol: class {
    var settings: Settings { get set }
    func userDataFetched(_ registrationItems: RegistrationEntity, from: UIViewController)
    
}

protocol RegistrationRouterProtocol: class {
    static func createMenuModule(regRef: RegistrationViewController)
    func openLoginScene(from view: UIViewController)
}
