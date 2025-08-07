//
//  MainViewController.swift
//  ShiftStore
//
//  Created by S&Q on 04.08.2025.
//

import UIKit

final class MainViewController: UIViewController {
  
  let data = MockTableData.getData()
  
  let tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return tableView
  }()
  
  let greetingButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Приветствие", for: .normal)
    button.backgroundColor = .blue
    button.layer.cornerRadius = 12
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
    setupActions()
  }
  
  private func setupUI() {
    tableView.dataSource = self
    navigationItem.title = "Главный экран"
    view.backgroundColor = .white
    view.addSubview(tableView)
    view.addSubview(greetingButton)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      tableView.bottomAnchor.constraint(equalTo: greetingButton.topAnchor, constant: -20),
      
      greetingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      greetingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      greetingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      greetingButton.heightAnchor.constraint(equalToConstant: 48),
      
    ])
  }
  
  private func setupActions() {
    greetingButton.addTarget(self, action: #selector(greetingButtonTapped), for: .touchUpInside)
  }
  
  @objc private func greetingButtonTapped() {
    guard let userData = UserDefaults.standard.dictionary(forKey: "userData") as? [String: String],
          let firstName = userData["firstName"] else {
      print("button did tapped")
      return
    }
    
    let alert = UIAlertController(
      title: "Приветствие",
      message: "Привет, \(firstName)! Рады видеть вас снова!",
      preferredStyle: .alert
    )
    
    alert.addAction(UIAlertAction(title: "Закрыть", style: .default))
    present(alert, animated: true)
  }
  
}

extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let item = data[indexPath.row]
    
    var config = cell.defaultContentConfiguration()
    config.text = item.userFirstName
    config.secondaryText = item.userLastName
    cell.contentConfiguration = config
    return cell
  }
}
