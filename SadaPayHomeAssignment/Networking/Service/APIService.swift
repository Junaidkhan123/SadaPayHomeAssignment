//
//  APIService.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 24/12/2022.
//

import Foundation
protocol APIServiceProtocol {
    func  fetchTrendingRepos(completionHandler: @escaping (Result<[TrendingItemModel],APIError>) -> Void)
}

struct APIService: APIServiceProtocol, WebClient{

    let session: URLSessionProtocol
    let decoder: JSONDecoder

    init(session: URLSessionProtocol = URLSession.shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }

    func fetchTrendingRepos(completionHandler: @escaping (Result<[TrendingItemModel], APIError>) -> Void) {
        execute(session: session,
                endPoint: GithubRequest.searchRepository,
                responseModel: TrendingItemResult.self,
                decoder: .init(),
                isFromCache: true) { result in
            switch result {
            case .success(let trendingItemResult):
                completionHandler(.success(trendingItemResult.items))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
