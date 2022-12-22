//
//  RequestStub.swift
//  SadaPayHomeAssignmentTests
//
//  Created by Junaid on 22/12/2022.
//

import Foundation
@testable import SadaPayHomeAssignment

enum RequestStub {
    case unAcceptableEndPoint
    case acceptableEndPoint
}

extension RequestStub: RequestProtocol {
    var path: String {
        switch self {
        case .unAcceptableEndPoint:
            return "unknow path"
        case .acceptableEndPoint:
            return "/v1"
        }
    }

    var baseURL: String {
        switch self {
        case .unAcceptableEndPoint:
            return "no domain available"
        case .acceptableEndPoint:
            return  "google.com"
        }
    }

    var requestType: RequestType {
        switch self {
        case .unAcceptableEndPoint:
            return .get

        case .acceptableEndPoint:
            return .get

        }
    }

    var requestHeader: [String : String]? {
        switch self {
        case .unAcceptableEndPoint:
            return nil
        case .acceptableEndPoint:
            return  ["requestHeader": "requestHeader"]
        }
    }

    var urlParams: [String : Any?]?  {
        switch self {
        case .unAcceptableEndPoint:
            return nil
        case .acceptableEndPoint:
            return  ["urlParams": "urlParams"]
        }
    }
}
