//
//  Registration + InitView.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 08.02.2024.
//

import Foundation

extension RegistrationViewController {
    
    func addSubviews() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(emailStackView)
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        
        mainStackView.addArrangedSubview(passwordStackView)
        passwordStackView.addArrangedSubview(passwordLabel)
        passwordStackView.addArrangedSubview(passwordTextField)
        
        mainStackView.addArrangedSubview(confirmPasswordStackView)
        confirmPasswordStackView.addArrangedSubview(confirmPasswordLabel)
        confirmPasswordStackView.addArrangedSubview(confirmPasswordTextField)
        
        mainStackView.addArrangedSubview(registerButton)
        
        view.addSubview(alreadyHaveAccLabel)
        view.addSubview(loginButton)
        
        setupLayout()
        setupRegisterButton()
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
        confirmPasswordStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        confirmPasswordLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        confirmPasswordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        registerButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        alreadyHaveAccLabel.snp.makeConstraints { make in
            make.top.equalTo(mainStackView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(alreadyHaveAccLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(150)
        }
    }
}
