//
//  Routes.swift
//  Kursach
//
//  Created by Alexey Dubovik on 12.05.24.
//

import Foundation

enum Routes: String {
    case products = "/api/getProducts"
    case login = "/api/login"
    case order = "/api/create_order"
    func callAsFunction() -> String {
        return rawValue
    }
}
