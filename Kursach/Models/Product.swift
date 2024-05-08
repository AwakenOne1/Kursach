//
//  Product.swift
//  Kursach
//
//  Created by Alexey Dubovik on 8.05.24.
//

import Foundation

struct Product {
    let name: String
    let price: Int
    let imageName: String
    let description: String
    
    init(name: String, price: Int, imageName: String, description: String) {
        self.name = name
        self.price = price
        self.imageName = imageName
        self.description = description
    }
}
