//
//  Endpoint.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Endpoint {
    associatedtype Response: Decodable
        
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var queryItems: [String: String]? { get }
    var body: [String: Any]? { get }
    
    func decode(_ data: Data) throws -> Response
}

extension Endpoint {
    var url: URL {
        var components: URLComponents = .init()
        components.scheme = "https"
        components.host = APIConfiguration.baseURL
        components.path = path
        components.queryItems = queryItems?.map{ .init(name: $0, value: $1) }
        
        guard let url = components.url
        else {
            fatalError("Failed to create URL")
        }
        
        return url
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var queryItems: [String : String]? {
        return nil
    }
    
    var body: [String: Any]? {
        return nil
    }
    
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}
