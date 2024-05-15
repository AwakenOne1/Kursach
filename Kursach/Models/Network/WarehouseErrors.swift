//
//  WareHouseErrors.swift
//  Kursach
//
//  Created by Alexey Dubovik on 10.05.24.
//

import Foundation

enum WarehouseErrors: LocalizedError {
    var descriprion: String {
        switch self {
        case .failedResponse: return "Ошибка запроса"
        case .failedDecoding: return "Ошибка  декодинга"
        case .invalidUrl: return "Неправильная ссылка"
        case .networkError: return "Ошибка сети"
        case .missingData: return "Нехватка данных"
        case .failedEncoding: return "Ошибка кодирования"
        }
    }
    case failedResponse
    case failedDecoding
    case invalidUrl
    case networkError
    case missingData
    case failedEncoding
}
