//
//  Errors.swift
//  ShiftStore
//
//  Created by S&Q on 08.08.2025.
//

enum NetworkErrors: Error {
  
  case invalidParams
  case invalidURL
  case invalidResponse(String?)
  case unknown
}

