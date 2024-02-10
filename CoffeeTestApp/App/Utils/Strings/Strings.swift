//
//  Strings.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 10.02.2024.
//

import Foundation

enum Strings: String {
    
    // MARK: - Регистрация
    case email = "e-mail"
    case exampleEmail = "example@mail.com"
    case password = "Пароль"
    case enterPassword = "Enter Password"
    case repeatPassword = "Повторите пароль"
    case registration = "Регистрация"
    case alreadyHaveAcc = "Уже есть аккаунт?"
    
    // MARK: - Логин
    case login = "Войти"
    case navigationLogin = "Вход"
    
    // MARK: - Ближайшие кафе
    case showOnMap = "Показать на карте"
    case nearlyCaffees = "Ближайшие кофейни"
    
    // MARK: - Карта
    case map = "Карта"
    
    // MARK: - Меню
    case menu = "Меню"
    case doPayment = "Перейти к оплате"
    
    // MARK: - Заказ
    case makeOrder = "Оплатить"
    case order = "Заказ"
    case gratzOrder = "Благодарим за заказ, ожидайте курьера в течение 15 минут"
    case errorDialog = "Вы пока что не добавили ничего к заказу, вернитесь на предыдущий экран и добавьте товары"
    case cancel = "Отмена"
    case orderInformer = "Время ожидания заказа\n15 минут!\nСпасибо, что выбрали нас!"
    
}
