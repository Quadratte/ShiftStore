//
//  Services.swift
//  ShiftStore
//
//  Created by S&Q on 08.08.2025.
//

import Foundation

protocol NetworkServiceProtocol {
  func request<T: Decodable>(
    endPoint: String,
    host: String,
    httpMethod: HTTPMethods,
    completion: @escaping (Result<T, NetworkErrors>) -> Void
  )
}

extension NetworkServiceProtocol {
  func request<T: Decodable>(endPoint: String, completion: @escaping (Result<T, NetworkErrors>) -> Void) {
    request(
      endPoint: endPoint,
      host: NetworkEndpoints.Host.host.rawValue,
      httpMethod: .get,
      completion: completion
    )
  }
}

struct NetworkService: NetworkServiceProtocol {
  func request<T>(
    endPoint: String,
    host: String,
    httpMethod: HTTPMethods,
    completion: @escaping (Result<T, NetworkErrors>) -> Void
  ) where T : Decodable {
    do {
      let request = try makeRequest(endPoint: endPoint, host: host, httpMethod: httpMethod)
      
      URLSession.shared.dataTask(with: request) { data, response, error in
        if error != nil { return completion(.failure(.unknown)) }
        
        guard let data = data else { return completion(.failure(.unknown)) }
        do {
          let decode = try JSONDecoder().decode(T.self, from: data)
          DispatchQueue.main.async { completion(.success(decode)) }
        } catch {
          return completion(.failure(.invalidResponse("Error data")))
        }
      }.resume()
    } catch {
      completion(.failure(.invalidParams))
    }
  }
  
  func makeRequest(endPoint: String, host: String, httpMethod: HTTPMethods) throws -> URLRequest {
    guard let components = URLComponents(string: host + endPoint) else {
      throw NetworkErrors.invalidURL
    }
    
    guard let urlReq = components.url else {
      throw NetworkErrors.invalidParams
    }
    
    var urlRequest = URLRequest(url: urlReq)
    urlRequest.httpMethod = httpMethod.rawValue
    
    return urlRequest
  }
}


