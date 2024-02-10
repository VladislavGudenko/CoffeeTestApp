//
//  ViewController.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import UIKit
import SnapKit
import CoreLocation

class RegistrationViewController: UIViewController, RegistrationViewProtocol {
    
    let settings = Settings()
    let locationManager = LocationManager()
    
    var presenter: RegistrationPresenterProtocol?
    
    let mainStackView = VerticalStackView(frame: .zero, spacing: 24)
    let emailStackView = VerticalStackView(frame: .zero, spacing: 12)
    let passwordStackView = VerticalStackView(frame: .zero, spacing: 12)
    let confirmPasswordStackView = VerticalStackView(frame: .zero, spacing: 12)
    let emailLabel = TextFieldName(text: Strings.email.rawValue)
    let emailTextField = CustomTextField(text: Strings.exampleEmail.rawValue,
                                         isNeedToSecure: false)
    let passwordLabel = TextFieldName(text: Strings.password.rawValue)
    let passwordTextField = CustomTextField(text: Strings.enterPassword.rawValue,
                                            isNeedToSecure: true)
    let confirmPasswordLabel = TextFieldName(text: Strings.repeatPassword.rawValue)
    let confirmPasswordTextField = CustomTextField(text: Strings.repeatPassword.rawValue,
                                                   isNeedToSecure: true)
    let registerButton = CustomBigButton(frame: .zero,
                                         buttonTitle: Strings.registration.rawValue)
    let alreadyHaveAccLabel = TextFieldName(text: Strings.alreadyHaveAcc.rawValue)
    let loginButton = CustomBigButton(frame: .zero,
                                      buttonTitle: Strings.login.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RegistrationRouterImp.createMenuModule(regRef: self)
        presenter?.viewDidLoad()
        setupUI()
        addSubviews()
    }
    
    @objc func registerTap() {
        guard let login = emailTextField.text,
              let password = passwordTextField.text else {
            return
        }
        presenter?.login = login
        presenter?.password = password
        presenter?.fetchData(from: self)
    }
    
    @objc func loginTap() {
        presenter?.openLoginScene(with: self)
    }
    
    func setupUI() {
        self.navigationItem.title = Strings.registration.rawValue
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = MainColors.navigationBarColor
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = MainColors.navigationBarColor
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    func setupRegisterButton() {
        registerButton.addTarget(self, action: #selector(registerTap), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginTap), for: .touchUpInside)
    }
}
