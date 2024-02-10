//
//  RegistrationInteractorImp.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 08.02.2024.
//

import Foundation
import UIKit

class RegistrationInteractorImp: RegistrationInputInteractorProtocol {
    
    var presenter: RegistrationOutputInteractorProtocol?
    
    func fetchUserData(login: String, password: String, from: UIViewController) {
        RequestManager.request(requestType: .register(login: login, password: password)) { [weak self] (result: Result<RegistrationEntity, Error>) in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    self?.presenter?.settings.authToken = data.token
                    print(data)
                    self?.presenter?.userDataFetched(data, from: from)
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
    
    
    
}
