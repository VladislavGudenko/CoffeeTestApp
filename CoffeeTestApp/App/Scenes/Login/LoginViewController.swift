//
//  LoginViewController.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
    
    var presenter: LoginPresenterProtocol?
        
    let mainStackView = VerticalStackView(frame: .zero, spacing: 24)
    let emailStackView = VerticalStackView(frame: .zero, spacing: 12)
    let passwordStackView = VerticalStackView(frame: .zero, spacing: 12)
    let emailLabel = TextFieldName(text: Strings.email.rawValue)
    let emailTextField = CustomTextField(text: Strings.exampleEmail.rawValue,
                                         isNeedToSecure: false)
    let passwordLabel = TextFieldName(text: Strings.password.rawValue)
    let passwordTextField = CustomTextField(text: Strings.enterPassword.rawValue,
                                            isNeedToSecure: true)
    let loginButton = CustomBigButton(frame: .zero,
                                      buttonTitle: Strings.login.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addSubviews()
    }
    
    func setupUI() {
        self.navigationItem.title = Strings.navigationLogin.rawValue
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = MainColors.navigationBarColor
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = MainColors.navigationBarColor
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    @objc func loginTap() {
        guard let login = emailTextField.text,
                let password = passwordTextField.text else {
            return
        }
        presenter?.login = login
        presenter?.password = password
        presenter?.fetchData(from: self)
    }
    
    func setupLoginButton() {
        loginButton.addTarget(self, action: #selector(loginTap), for: .touchUpInside)
    }
}
