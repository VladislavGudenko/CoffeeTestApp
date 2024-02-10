//
//  RequestSettings.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation

enum Request {
    // сюда добавляем все запросы которые могли бы быть и входные параметры которые мы отдаем на запросе
    case register(login: String, password: String)
    case auth(login: String, password: String)
    case locations
    case menu
}
    // внутри данной структуры мы формируем запрос полностью - добавляем эндпоинт, квери параметры, хэдэры, апи-ключи и т д и возвращаем готовый URLRequest
struct RequestSettings {
    
    static func setupRequest(type: Request) -> URLRequest? {
        
        var request: URLRequest
        
        switch type {
        case let .register(login: login, password: password):
            if let url = URL(string: ConfigEndpoind.registerEndpoint) {
                request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
                let parameters = [
                    "login": login,
                    "password": password
                ] as [String : Any]
                guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
#if DEBUG
                    print("ошибка setupRequest getGeo")
#endif
                    return nil
                }
                request.httpBody = jsonData
                return request
            } else {
                return nil
            }
        case let .auth(login: login, password: password):
            if let url = URL(string: ConfigEndpoind.authEndpoint) {
                request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
                let parameters = [
                    "login": login,
                    "password": password
                ] as [String : Any]
                guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
                    return nil
                }
                request.httpBody = jsonData
                return request
            } else {
                return nil
            }
        case .locations:
            if let url = URL(string: ConfigEndpoind.locationsEndpoint) {
                request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("Bearer \(UserDefaultsManager.loadToken())", forHTTPHeaderField: "Authorization")
                print(request)
                print(UserDefaultsManager.loadToken())
                return request
            } else {
                return nil
            }
        case .menu:
            if let url = URL(string: ConfigEndpoind.menuEndpoint) {
                request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("Bearer \(UserDefaultsManager.loadToken())", forHTTPHeaderField: "Authorization")
                print(request)
                print(UserDefaultsManager.loadToken())
                return request
            } else {
                return nil
            }
        }
        
    }
}
