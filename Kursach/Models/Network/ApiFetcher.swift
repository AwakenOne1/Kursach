//
//  ApiFetcher.swift
//  Kursach
//
//  Created by Alexey Dubovik on 12.05.24.
//

import Foundation

class ApiFetcher: HTTPClient {
    func request<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, WarehouseErrors>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            if let responce = urlResponse as? HTTPURLResponse,
               (401...403).contains(responce.statusCode) {
                completion(.failure(.invalidData))
                return
            }
            guard let urlResponce = urlResponse as? HTTPURLResponse,
                  (200...299).contains(urlResponce.statusCode) else {
                completion(.failure(.invalidUrl))
                return
            }
            guard let data = data else {
                completion(.failure(.missingData))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.failedDecoding))
            }
        }.resume()
    }
}
