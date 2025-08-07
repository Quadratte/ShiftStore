//
//  GreetingViewController.swift
//  ShiftStore
//
//  Created by S&Q on 07.08.2025.
//

import UIKit

class GreetingViewController: UIViewController {
  
  let greetingLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 32, weight: .bold)
    //label.text = "Хеллоуф"
    label.textColor = .blue
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    setupConstraints()
  }
  
  private func setupUI() {
    view.backgroundColor = .white
    view.addSubview(greetingLabel)
  }
  
  private func setupConstraints() {
    
    NSLayoutConstraint.activate([
      greetingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
      greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    ])
  }
  
  func configure(with name: String) {
          greetingLabel.text = "Привет, \(name)!\nРады видеть вас снова!"
      }
  
}
