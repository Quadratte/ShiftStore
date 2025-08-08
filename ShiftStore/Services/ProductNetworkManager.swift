//
//  ProductNetworkManager.swift
//  ShiftStore
//
//  Created by S&Q on 08.08.2025.
//

import Foundation

protocol ProductNetworkManagerProtocol {
  func fetchProducts(comletion: @escaping ([TableData]) -> Void)
}

final class ProductNetworkManager: ProductNetworkManagerProtocol {
  
  let networkSerivce: NetworkServiceProtocol
  
  init(networkSerivce: NetworkServiceProtocol) {
    self.networkSerivce = networkSerivce
  }
  
  func fetchProducts(comletion: @escaping ([TableData]) -> Void) {
    networkSerivce.request(endPoint: NetworkEndpoints.products.path) { (result: Result<[TableData], NetworkErrors>) in
      switch result {
      case .success(let data):
        comletion(data)
      case .failure(let error):
        print(error)
      }
    }
  }
}
