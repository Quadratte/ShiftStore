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
    label.textColor = .blue
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }()
  
  let closeButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Закрыть", for: .normal)
    button.backgroundColor = .blue
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 12
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
    setupActions()
  }
  
  func configureLabel(name: String) {
    greetingLabel.text = "Привет, \(name)!\nРады видеть вас снова!"
  }
  
  private func setupUI() {
    view.backgroundColor = .white
    view.addSubview(greetingLabel)
    view.addSubview(closeButton)
  }
  
  private func setupConstraints() {
    
    NSLayoutConstraint.activate([
      greetingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
      greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      closeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
      closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      closeButton.heightAnchor.constraint(equalToConstant: 48),
    ])
  }
  
  private func setupActions() {
    closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
  }
  
  @objc private func closeButtonTapped() {
    dismiss(animated: true)
  }
}
