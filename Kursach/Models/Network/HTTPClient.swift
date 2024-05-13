//
//  ApiFetcher.swift
//  Kursach
//
//  Created by Alexey Dubovik on 12.05.24.
//

import Foundation

protocol HTTPClient {
    func request<T: Decodable>(request: URLRequest,
                               completion: @escaping (Result<T, WarehouseErrors>) -> Void)
}
