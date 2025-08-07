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
      MockTableData(userFirstName: "Name4", userLastName: "family4"),
      MockTableData(userFirstName: "Name5", userLastName: "family5"),
      MockTableData(userFirstName: "Name6", userLastName: "family6"),
      MockTableData(userFirstName: "Name7", userLastName: "family7"),
      MockTableData(userFirstName: "Name8", userLastName: "family8"),
      MockTableData(userFirstName: "Name9", userLastName: "family9"),
      MockTableData(userFirstName: "Name10", userLastName: "family10"),
      MockTableData(userFirstName: "Name11", userLastName: "family11"),
      MockTableData(userFirstName: "Name12", userLastName: "family12"),
      MockTableData(userFirstName: "Name13", userLastName: "family13"),
      MockTableData(userFirstName: "Name14", userLastName: "family14"),
    ]
  }
  
}
