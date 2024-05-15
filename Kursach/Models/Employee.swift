//
//  Worker.swift
//  Kursach
//
//  Created by Alexey Dubovik on 13.05.24.
//

import Foundation

struct Employee: Decodable {
    let id: Int
    let fullName: String
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case fullName = "full_name"
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.fullName = try container.decode(String.self, forKey: .fullName)
    }
}
