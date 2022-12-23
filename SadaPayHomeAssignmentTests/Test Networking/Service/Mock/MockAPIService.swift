//
//  MockAPIService.swift
//  SadaPayHomeAssignmentTests
//
//  Created by Junaid on 24/12/2022.
//

import Foundation
@testable import SadaPayHomeAssignment
struct MockSuccessAPIService: APIServiceProtocol, WebClient {

    func  fetchTrendingRepos(completionHandler: @escaping (Result<[TrendingItemModel],APIError>) -> Void) {
        completionHandler(.success(TrendingItemResult.stub.items))
    }
}

struct MockFailureAPIService: APIServiceProtocol, WebClient {

    func  fetchTrendingRepos(completionHandler: @escaping (Result<[TrendingItemModel],APIError>) -> Void) {
        completionHandler(.failure(.NoDataFound))
    }
}
