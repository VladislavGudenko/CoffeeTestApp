//
//  MenuInterractorIm.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 08.02.2024.
//

import Foundation

class MenuInteractorImp: MenuInputInteractorProtocol {
    
    weak var presenter: MenuOutputInteractorProtocol?
    
    func fetchMenu() {
        RequestManager.request(requestType: .menu) { [weak self] (result: Result<[MenuEntity], Error>) in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    self?.presenter?.menuFetched(data)
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
    
    
}
