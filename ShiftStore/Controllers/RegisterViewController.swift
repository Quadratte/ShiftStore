//
//  RegisterViewController.swift
//  ShiftStore
//
//  Created by S&Q on 04.08.2025.
//

import UIKit

final class RegisterViewController: UIViewController {
  var services: AppContainerProtocol
  init(services: AppContainerProtocol) {
      self.services = services
      super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

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
    return dateOfBirth.registerTextField(placeholder: "Дата рождения (дд.мм.гггг)", isSecureEntry: false)
  }()
  
  lazy var mainButton: UIButton = {
    let button = UIButton()
    return button.mainButton(title: "Регистрация", bgColor: .systemGray)
  }()
  
  lazy var errorLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.textColor = .red
    label.textAlignment = .center
    label.isHidden = true
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
    setupActions()
  }

  private func setupUI() {
    view.backgroundColor = .white
    view.addSubview(userFirstName)
    view.addSubview(userLastName)
    view.addSubview(dateOfBirth)
    view.addSubview(userPassword)
    view.addSubview(confirmUserPassword)
    view.addSubview(mainButton)
    view.addSubview(errorLabel)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      userFirstName.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
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
      mainButton.topAnchor.constraint(equalTo: confirmUserPassword.bottomAnchor, constant: 20),
      mainButton.heightAnchor.constraint(equalToConstant: 48),
      
      errorLabel.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: 20),
      errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    ])
  }
  
  private func setupActions() {
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
    UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
    
    navigateToMainScreen()
  }
  
  private func navigateToMainScreen() {
    let mainVC = MainViewController(services: services)
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
    
    let firstNameValid = firstName.count >= 2 && firstName.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
    if !firstNameValid {
      showError("Имя должно содержать только буквы, не менее двух")
      return false
    }
    
    let lastNameValid = lastName.count >= 2 && lastName.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
    if !lastNameValid {
      showError("Фамилия должна содержать только буквы, не менее двух")
      return false
    }
    
    let dateRegex = #"^(0[1-9]|[12][0-9]|3[01])\.(0[1-9]|1[012])\.(19|20)\d\d$"#
    let datePredicate = NSPredicate(format: "SELF MATCHES %@", dateRegex)
    let dateValid = datePredicate.evaluate(with: dateOfBirth)
    if !dateValid {
        showError("Дата рождения должна быть в формате дд.мм.гггг")
        return false
    }
    
    if password != confirmPassword {
        showError("Пароли не совпадают")
        return false
    }
    
    hideError()
    mainButton.isEnabled = true
    mainButton.backgroundColor = .blue
    return true
  }
  
  private func showError(_ message: String) {
      errorLabel.text = message
      errorLabel.isHidden = false
      mainButton.isEnabled = false
      mainButton.backgroundColor = .systemGray
  }
  
  private func hideError() {
      errorLabel.isHidden = true
  }
}

