//
//  ConfigEndpoint.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation

enum ConfigEndpoind {
    
    // Здесь все эндпоинты и АПИ ключи к Сервисам, Погода на текущий момент, поиск по городам и яндекс на недельный прогноз
    
    // OpenWeatherMap
    static var registerEndpoint = "http://147.78.66.203:3210/auth/register"
    static var authEndpoint = "http://147.78.66.203:3210/auth/login"
    static var locationsEndpoint = "http://147.78.66.203:3210/locations"
    static var menuEndpoint = "http://147.78.66.203:3210/location/1/menu"
}
