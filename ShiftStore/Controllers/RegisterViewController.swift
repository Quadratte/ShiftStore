//
//  RegisterViewController.swift
//  ShiftStore
//
//  Created by S&Q on 04.08.2025.
//

import UIKit

final class RegisterViewController: UIViewController {
  
  lazy var userFirstName: UITextField = {
    let userName = UITextField()
    return userName.registerTextField(placeholder: "Введите имя", isSecureEntry: false)
  }()
  
  lazy var userLastName: UITextField = {
    let userLastName = UITextField()
    return userLastName.registerTextField(placeholder: "Введите фамилию", isSecureEntry: false)
  }()
  
  lazy var userPassword: UITextField = {
    let userPassword = UITextField()
    return userPassword.registerTextField(placeholder: "Введите пароль", isSecureEntry: true)
  }()
  
  lazy var confirmUserPassword: UITextField = {
    let confurmPassword = UITextField()
    return confurmPassword.registerTextField(placeholder: "Подтвердите пароль", isSecureEntry: true)
  }()
  
  lazy var dateOfBirth: UITextField = {
    let dateOfBirth = UITextField()
    return dateOfBirth.registerTextField(placeholder: "Дата рождения ДД.ММ.ГГ", isSecureEntry: false)
  }()
  
  lazy var mainButton: UIButton = {
    let button = UIButton()
    return button.mainButton(title: "Регистрация")
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }

  private func setupUI() {
    view.backgroundColor = .white
    view.addSubview(userFirstName)
    view.addSubview(userLastName)
    view.addSubview(dateOfBirth)
    view.addSubview(userPassword)
    view.addSubview(confirmUserPassword)
    view.addSubview(mainButton)
  }
  
  private func setupConstraints() {
    
    NSLayoutConstraint.activate([
      
      userFirstName.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
      userFirstName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      userFirstName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      userFirstName.heightAnchor.constraint(equalToConstant: 42),
      
      userLastName.topAnchor.constraint(equalTo: userFirstName.bottomAnchor, constant: 20),
      userLastName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      userLastName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      userLastName.heightAnchor.constraint(equalToConstant: 42),
      
      dateOfBirth.topAnchor.constraint(equalTo: userLastName.bottomAnchor, constant: 20),
      dateOfBirth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      dateOfBirth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      dateOfBirth.heightAnchor.constraint(equalToConstant: 42),
      
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
  
  private func  setupActions() {
    [userFirstName, userLastName, dateOfBirth, userPassword, confirmUserPassword].forEach {
      $0.addTarget(self, action: #selector(textFieldAdjust), for: .editingChanged)
    }
    
    mainButton.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
    
  }
  
  @objc private func textFieldAdjust() {
    validateInputs()
  }
  
  @objc private func mainButtonTapped() {
    guard validateInputs() else { return }
    
    let userData: [String: String] = [
        "firstName": userFirstName.text ?? "",
        "lastName": userLastName.text ?? "",
        "birthDate": dateOfBirth.text ?? ""
    ]
    
    UserDefaults.standard.set(userData, forKey: "userData")
    UserDefaults.standard.set(true, forKey: "isRegistered")
    
    let mainVC = MainViewController()
    self.navigationController?.setViewControllers([mainVC], animated: true)
  }
  
  
  private func validateInputs() -> Bool {
    guard let firstName = userFirstName.text, !firstName.isEmpty,
          let lastName = userLastName.text, !lastName.isEmpty,
          let dateOfBirth = dateOfBirth.text, !dateOfBirth.isEmpty,
          let password = userPassword.text, !password.isEmpty,
          let confirmPassword = confirmUserPassword.text, !confirmPassword.isEmpty
    else {
      mainButton.isEnabled = false
      mainButton.backgroundColor = .systemGray
      return false
    }
    //let firstNameValid = userFirstName.count >= 2
    return true
  }
  
}





extension RegisterViewController: UITextFieldDelegate {
  
  
  
}

