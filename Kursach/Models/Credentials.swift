//
//  LoginResponse.swift
//  Kursach
//
//  Created by Alexey Dubovik on 13.05.24.
//

import Foundation

struct Credentials: Codable {
    let login: String
    let password: String
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case password = "password"
    }
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.login = try container.decode(String.self, forKey: .login)
        self.password = try container.decode(String.self, forKey: .password)
    }
}
