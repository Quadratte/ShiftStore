//
//  MockTableData.swift
//  ShiftStore
//
//  Created by S&Q on 06.08.2025.
//

struct MockTableData {
  
  let userFirstName: String
  let userLastName: String
  
  static func getData() -> [MockTableData] {
    [
      MockTableData(userFirstName: "Name1", userLastName: "family1"),
      MockTableData(userFirstName: "Name2", userLastName: "family2"),
      MockTableData(userFirstName: "Name3", userLastName: "family3"),
      
    ]
  }
  
}
