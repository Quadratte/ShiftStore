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
   //tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.backgroundColor = .blue
    return tableView
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
  }
  
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
      
    ])
  }
  
}

extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    return cell
  }
  
  
}
