//
//  RegisterViewController.swift
//  ShiftStore
//
//  Created by S&Q on 04.08.2025.
//

import UIKit

final class RegisterViewController: UIViewController {
  
  lazy var userName: UITextField = {
    let userName = UITextField()
    return userName.registerTextField(placeholder: "Имя", isSecureEntry: false)
  }()
  
  lazy var userLastName: UITextField = {
    let userLastName = UITextField()
    return userLastName.registerTextField(placeholder: "Фамилия", isSecureEntry: false)
  }()
  
  lazy var userPassword: UITextField = {
    let userPassword = UITextField()
    return userPassword.registerTextField(placeholder: "Пароль", isSecureEntry: true)
  }()
  
  lazy var confirmUserPassword: UITextField = {
    let confurmPassword = UITextField()
    return confurmPassword.registerTextField(placeholder: "Подтвердите пароль", isSecureEntry: true)
  }()
  
  lazy var dateOfBirth: UIDatePicker = {
    let datePicker = UIDatePicker()
    datePicker.translatesAutoresizingMaskIntoConstraints = false
    datePicker.datePickerMode = .date
    datePicker.layer.cornerRadius = 6
    datePicker.layer.masksToBounds = true
    datePicker.backgroundColor = .white
    datePicker.tintColor = .blue
    return datePicker
  }()
  
  lazy var mainButton: UIButton = {
    let button = UIButton()
    return button.mainButton(title: "Регистрация", action: tapToRegister)
  }()
  
  lazy var tapToRegister: UIAction = UIAction { _ in
    let mainVC = MainViewController()
    self.navigationController?.pushViewController(mainVC, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupUI()
    setupConstraints()
  }

  private func setupUI() {
    view.addSubview(userName)
    view.addSubview(userLastName)
    view.addSubview(dateOfBirth)
    view.addSubview(userPassword)
    view.addSubview(confirmUserPassword)
    view.addSubview(mainButton)
  }
  
  private func setupConstraints() {
    
    NSLayoutConstraint.activate([
      
      userName.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
      userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      userName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      userName.heightAnchor.constraint(equalToConstant: 42),
      
      userLastName.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 20),
      userLastName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      userLastName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      userLastName.heightAnchor.constraint(equalToConstant: 42),
      
      dateOfBirth.topAnchor.constraint(equalTo: userLastName.bottomAnchor, constant: 20),
      dateOfBirth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      
      userPassword.topAnchor.constraint(equalTo: dateOfBirth.bottomAnchor, constant: 20),
      userPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      userPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      userPassword.heightAnchor.constraint(equalToConstant: 42),
      
      confirmUserPassword.topAnchor.constraint(equalTo: userPassword.bottomAnchor, constant: 20),
      confirmUserPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      confirmUserPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      confirmUserPassword.heightAnchor.constraint(equalToConstant: 42),
      
      mainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      mainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      mainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      mainButton.heightAnchor.constraint(equalToConstant: 48),
    ])
  }
}


extension RegisterViewController: UITextFieldDelegate {
  
  
  
}

