//
//  HttpMethods.swift
//  Kursach
//
//  Created by Alexey Dubovik on 12.05.24.
//

import Foundation

enum HttpMethods: String {
    case GET = "GET"
    case POST = "POST"
    func callAsFunction() -> String {
        return rawValue
    }
}
