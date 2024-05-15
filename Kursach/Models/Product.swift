//
//  Product.swift
//  Kursach
//
//  Created by Alexey Dubovik on 8.05.24.
//

import Foundation

struct Product: Decodable {
    var id: Int = 0
    let name: String
    let price: Int
    let imageName: String
    let description: String
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case imageName
        case description
    }
    init(id: Int, name: String, price: Int, imageName: String, description: String) {
        self.id = id
        self.name = name
        self.price = price
        self.imageName = imageName
        self.description = description
    }
    init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawId = try? values.decode(Int.self, forKey: .id)
        let rawName = try? values.decode(String.self, forKey: .name)
        let rawPrice = try? values.decode(Int.self, forKey: .price)
        let rawImageName = try? values.decode(String.self, forKey: .imageName)
        let rawDescription = try? values.decode(String.self, forKey: .description)
        guard let id = rawId,
              let name = rawName,
              let price = rawPrice,
              let imageName = rawImageName,
              let description = rawDescription
        else {
            throw WarehouseErrors.missingData
        }
        self.id = id
        self.name = name
        self.price = price
        self.imageName = imageName
        self.description = description
    }
}
