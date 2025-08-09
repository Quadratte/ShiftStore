//
//  DIContainer.swift
//  ShiftStore
//
//  Created by S&Q on 08.08.2025.
//

import UIKit

protocol AppContainerProtocol {
  var network: ProductNetworkManagerProtocol { get }
}

final class DIContainer: AppContainerProtocol {
  var network: ProductNetworkManagerProtocol
  static let shared = DIContainer()
  
  private init() {
    let networkService = NetworkService()
    self.network = ProductNetworkManager(networkSerivce: networkService)
  }
}
