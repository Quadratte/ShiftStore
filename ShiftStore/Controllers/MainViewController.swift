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
    return button.mainButton(title: "Приветствие", bgColor: .blue)
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  func setupUI() {
    tableView.dataSource = self
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
