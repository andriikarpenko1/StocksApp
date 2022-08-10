//
//  NetworkController.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import Foundation
import Combine

protocol NetworkControllerProtocol {
    func request<RequestModel: Endpoint>(endpoint: RequestModel) -> AnyPublisher<RequestModel.Response, NetworkError>
}

final class NetworkController {
    static let shared: NetworkController = .init()
        
    // MARK: - Properties
    
    private let networkQueue: DispatchQueue = .init(label: "NetworkQueue", qos: .default)
    
    private let jsonDecoder: JSONDecoder = .init()
    
    // MARK: - Init
    
    private init() {}
}

extension NetworkController: NetworkControllerProtocol {
    func request<RequestModel: Endpoint>(endpoint: RequestModel) -> AnyPublisher<RequestModel.Response, NetworkError> {
        
        var request: URLRequest = .init(url: endpoint.url)
        request.httpMethod = endpoint.method.rawValue
        request.setBody(params: endpoint.body)
        request.setHeaders(endpoint.headers)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: networkQueue)
            .breakpointOnError()
            .tryMap({ data, response in
                if let response = response as? HTTPURLResponse,
                   !(200...299).contains(response.statusCode) {
                    throw NetworkError(statusCode: response.statusCode)
                }
                
                return data
            })
            .decode(type: RequestModel.Response.self, decoder: jsonDecoder)
            .mapError { error in
                return NetworkError(error: error)
            }
            .eraseToAnyPublisher()
    }
}
