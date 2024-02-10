//
//  RegistrationPresenterImp.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 08.02.2024.
//

import Foundation
import UIKit

class RegistrationPresenterImp: RegistrationPresenterProtocol {
    
    var interactor: RegistrationInputInteractorProtocol?
    var view: RegistrationViewProtocol?
    var router: RegistrationRouterProtocol?
    
    var settings = Settings()
    
    var login: String?
    var password: String?
    
    let locationManager = LocationManager()
    
    func viewDidLoad() {
        locationManager.activateLocation()
    }
    
    func fetchData(from: UIViewController) {
        interactor?.fetchUserData(login: login ?? "", password: password ?? "", from: from)
    }
}

extension RegistrationPresenterImp: RegistrationOutputInteractorProtocol {
    
    func userDataFetched(_ registrationItems: RegistrationEntity, from: UIViewController) {
        openLoginScene(with: from)
    }
    
    func openLoginScene(with: UIViewController) {
        router?.openLoginScene(from: with)
    }
    
    
}
