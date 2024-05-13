//
//  DataRequest.swift
//  Kursach
//
//  Created by Alexey Dubovik on 12.05.24.
//

import Foundation

protocol DataRequest {
    associatedtype Response
    
    var url: String { get }
    var method: HttpMethods { get }
    var headers: [String:String] { get }
    var queryItems: [String:String] { get }
    
    func decode(data: Data) throws -> Response
}

extension DataRequest where Response: Decodable {
    func decode(data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}

extension DataRequest {
    var headers: [String : String] {
        [:]
    }
    
    var queryItems: [String : String] {
        [:]
    }
}
