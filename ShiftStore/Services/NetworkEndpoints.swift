
//
//  NetworkEndpoits.swift
//  ShiftStore
//
//  Created by S&Q on 08.08.2025.
//

// "https://fakestoreapi.com/products"

enum NetworkEndpoints {
  case products
  
  enum Host: String {
    case host = "https://fakestoreapi.com"
  }
  
  var path: String {
    switch self {
    case .products: "/products"
    }
  }
}
