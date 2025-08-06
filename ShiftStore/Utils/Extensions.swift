//
//  Extensions.swift
//  ShiftStore
//
//  Created by S&Q on 04.08.2025.
//

import UIKit

extension UITextField {
  
  func registerTextField(placeholder: String, isSecureEntry: Bool) -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = .white
    textField.layer.cornerRadius = 6
    textField.layer.borderWidth = 2
    textField.layer.borderColor = UIColor.blue.cgColor
    textField.leftViewMode = .always
    textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 42))
    textField.placeholder = placeholder
    textField.isSecureTextEntry = isSecureEntry
    
    return textField
  }
}

extension UIButton {
  
  func mainButton(title: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(title, for: .normal)
    button.isEnabled = false
    button.backgroundColor = .blue
    button.layer.cornerRadius = 12
    return button
  }
}
