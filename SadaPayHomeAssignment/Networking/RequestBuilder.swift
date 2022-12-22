//
//  RequestBuilder.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 22/12/2022.
//

import Foundation
/*/

 taking inspiration from the following book to create network layer
  https://www.kodeco.com/books/real-world-ios-by-tutorials/v1.0/chapters/3-data-layer-networking

 */

protocol RequestProtocol {
    var path: String { get }
    var baseURL: String { get }
    var requestType: RequestType { get }
    var requestHeader: [String: String]? { get }
    var urlParams: [String: Any?]? { get}
}

extension RequestProtocol {

    func createURLRequest() -> URLRequest? {
        guard let url = url() else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        request.allHTTPHeaderFields = requestHeader
        request.timeoutInterval = 5.0
        return request
    }

    private func url() -> URL? {
        var component = URLComponents()
        component.scheme = "https"
        component.path = path
        component.host = baseURL
        component.queryItems = queryItems

        guard let url = component.url else { return nil }
        return url
    }

    private var queryItems: [URLQueryItem]? {
        guard  requestType == .get, let params = urlParams
        else { return nil }
        return  params.map( { URLQueryItem(name: $0, value: "\($1 ?? "")")})
    }
}
