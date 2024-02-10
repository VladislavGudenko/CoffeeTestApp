//
//  Login + InitView.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation

extension LoginViewController {
    
    func addSubviews() {
        view.addSubview(mainStackView)

        mainStackView.addArrangedSubview(emailStackView)
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        
        mainStackView.addArrangedSubview(passwordStackView)
        passwordStackView.addArrangedSubview(passwordLabel)
        passwordStackView.addArrangedSubview(passwordTextField)
        
        mainStackView.addArrangedSubview(loginButton)
        setupLoginButton()
        setupLayout()
    }
    
    func setupLayout() {
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(18)
            make.center.equalToSuperview()
        }
        emailStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        emailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        passwordStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        passwordLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        loginButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
    }
}
