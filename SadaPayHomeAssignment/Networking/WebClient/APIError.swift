//
//  APIError.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 23/12/2022.
//

import Foundation
enum APIError: Error, Equatable {
    case invalidURL
    case NoDataFound
    case invalidResponse
    case badRequest(String?)
    case serverError(String?)
    case decoding(String?)
    case unknown(String?)
    case corrupetData
}
