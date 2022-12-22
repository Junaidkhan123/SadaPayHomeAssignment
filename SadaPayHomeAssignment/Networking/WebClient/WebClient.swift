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
                               isFromCache: Bool,
                               completionHandler: @escaping (Result<T, APIError>) -> Void)
}

extension WebClient {
    func execute<T: Decodable>(session: URLSessionProtocol,
                               endPoint: RequestProtocol,
                               responseModel: T.Type,
                               decoder: JSONDecoder,
                               isFromCache: Bool = true,
                               completionHandler: @escaping (Result<T, APIError>) -> Void ) {

        guard let ulrRequest = endPoint.createURLRequest() else {
            completionHandler(.failure(.invalidURL))
            return
        }
        let task = session.dataTask(with: ulrRequest) { retrievedData, URLResponse, error in
            guard let retrievedData = retrievedData  else {
                completionHandler(.failure(.NoDataFound))
                return
            }

            guard let response  = URLResponse as? HTTPURLResponse  else {
                completionHandler(.failure(.invalidResponse))
                return
            }

            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? decoder.decode(responseModel, from: retrievedData) else {
                    completionHandler(.failure(.corrupetData))
                    return
                }
                completionHandler(.success(decodedResponse))
            case 400...499:
                completionHandler(.failure(.badRequest("Bad URL Request error!")))
            case 500...599:
                completionHandler(.failure(.serverError("something went wrong")))
            default:
                completionHandler(.failure(.unknown("something went wrong")))
            }
        }
        task.resume()
    }
}

