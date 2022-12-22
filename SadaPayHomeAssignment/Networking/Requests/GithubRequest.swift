//
//  GithubRequest.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 22/12/2022.
//

import Foundation
enum GithubRequest {
    case searchRepository
}

extension GithubRequest: RequestProtocol {

    var baseURL: String { "api.github.com" }

    var path: String {
        switch self {
        case .searchRepository:
            return "/search/repositories"
        }
    }

    var requestType: RequestType { .get }

    var requestHeader: [String : String]? { nil }

    var urlParams: [String: Any?]? {
        ["q": "language=+sort:stars"]
    }
}
