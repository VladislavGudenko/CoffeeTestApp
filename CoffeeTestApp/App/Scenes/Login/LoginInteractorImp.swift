//
//  LoginInteractor.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation
import UIKit

class LoginInteractorImp: LoginInputInteractorProtocol {
    
    var presenter: LoginOutputInteractorProtocol?
    
    func fetchUserData(login: String, password: String, from: UIViewController) {
        RequestManager.request(requestType: .auth(login: login, password: password)) { [weak self] (result: Result<RegistrationEntity, Error>) in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    guard let token = data.token else { return }
                    self?.presenter?.settings.authToken = token
                    print(data)
                    self?.presenter?.userDataFetched(data, from: from)
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
}
