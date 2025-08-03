//
//  ViewController.swift
//  ShiftStore
//
//  Created by S&Q on 04.08.2025.
//

import UIKit

final class ViewController: UIViewController {

  lazy var userName: UITextField = {
    let userName = UITextField()
    userName.translatesAutoresizingMaskIntoConstraints = false
    userName.delegate = self
    userName.backgroundColor = .white
    userName.layer.cornerRadius = 6
    userName.layer.borderWidth = 2
    userName.layer.borderColor = UIColor.blue.cgColor
    userName.placeholder = "Enter your name"
    return userName
  }()
  
  lazy var dateOfBurth: UIDatePicker = {
    let datePicker = UIDatePicker()
    datePicker.translatesAutoresizingMaskIntoConstraints = false
    datePicker.datePickerMode = .date
    datePicker.layer.cornerRadius = 6
    datePicker.layer.masksToBounds = true
    datePicker.backgroundColor = .white
  
    datePicker.tintColor = .blue
    return datePicker
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(userName)
    view.addSubview(dateOfBurth)
    setupConstraints()
    
  }
  
  private func setupConstraints() {
    
    NSLayoutConstraint.activate([
      userName.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      userName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      userName.heightAnchor.constraint(equalToConstant: 32),
      
      dateOfBurth.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 20),
      dateOfBurth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      //dateOfBurth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    ])
  }
}


extension ViewController: UITextFieldDelegate {
  
}
