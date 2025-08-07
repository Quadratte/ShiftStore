//
//  NetworkLayer.swift
//  ShiftStore
//
//  Created by S&Q on 07.08.2025.
//

import Foundation

class NetworkLayer {
    static let shared = NetworkLayer()
    
    func fetchProducts(completion: @escaping (Result<[TableData], Error>) -> Void) {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([TableData].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    enum NetworkError: Error {
        case invalidURL
        case noData
    }
}
