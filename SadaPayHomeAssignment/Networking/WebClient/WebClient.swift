//
//  WebClient.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 22/12/2022.
//

import Foundation
protocol URLSessionProtocol {
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void ) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }

protocol WebClient {

    func execute<T: Decodable>(session: URLSessionProtocol,
                               endPoint: RequestProtocol,
                               responseModel: T.Type,
                               decoder: JSONDecoder,
                               isFromCache: Bool
                               completionHandler: @escaping (Result<T, Error>) -> Void)
}
