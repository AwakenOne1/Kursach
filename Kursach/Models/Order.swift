//
//  Order.swift
//  Kursach
//
//  Created by Alexey Dubovik on 15.05.24.
//

import Foundation

struct Order: Codable {
    let orderID: Int
    let products: [ProductInOrder]

    enum CodingKeys: String, CodingKey {
        case orderID = "order_id"
        case products
    }
    
}

struct ProductInOrder: Codable {
    let id: Int
    let name: String
    let price: Int
    
}
