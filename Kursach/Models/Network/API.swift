//
//  API.swift
//  Kursach
//
//  Created by Alexey Dubovik on 12.05.24.
//

import Foundation

class API {
    private let apiConfig: ApiConfig
    private let apiFetcher: HTTPClient
    init(apiConfig: ApiConfig, apiFetcher: HTTPClient) {
        self.apiConfig = apiConfig
        self.apiFetcher = apiFetcher
    }
    func getProducts(categoryId: Int, completion: @escaping (Result<[Product], WarehouseErrors>) -> Void) {
        var components = URLComponents()
        components.scheme = apiConfig.scheme
        components.host = apiConfig.host
        components.path = Routes.products.callAsFunction()
        components.queryItems = [
            URLQueryItem(name: "category_id", value: String(categoryId))
        ]
        guard let url = components.url else {
            completion(.failure(.invalidUrl))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HttpMethods.GET.callAsFunction()
        apiFetcher.request(request: urlRequest) { result in
            completion(result)
        }
    }
    func login(credentials: Credentials, completion: @escaping ( Result<Employee, WarehouseErrors>) -> Void) {
        var components = URLComponents()
        components.scheme = apiConfig.scheme
        components.host = apiConfig.host
        components.path = Routes.login.callAsFunction()
        //        guard let url = components.url else {
        //            completion(.failure(.invalidUrl))
        //            return
        //        }
        let url = components.url!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HttpMethods.POST.callAsFunction()
        guard let body = try? JSONEncoder().encode(credentials) else {
            completion(.failure(.failedEncoding))
            return
        }
        urlRequest.httpBody = body
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        apiFetcher.request(request: urlRequest) { result in
            completion(result)
        }
    }
    func getOrder(userId: Int, completion: @escaping (Result<Order, WarehouseErrors>) -> Void) {
        var components = URLComponents()
        components.scheme = apiConfig.scheme
        components.host = apiConfig.host
        components.path = Routes.order.callAsFunction()
        components.queryItems = [
            URLQueryItem(name: "user_id", value: String(userId))
        ]
        guard let url = components.url else {
            completion(.failure(.invalidUrl))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HttpMethods.GET.callAsFunction()
        apiFetcher.request(request: urlRequest) { result in
            completion(result)
        }
    }
}
