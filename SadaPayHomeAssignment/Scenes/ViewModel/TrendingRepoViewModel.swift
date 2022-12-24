//
//  TrendingRepoViewModel.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 24/12/2022.
//

import Foundation

protocol TrendingRepoViewModelType {
    var title : String { get }
    var trendingRepo: [TrendingItemModel] { get }
    func fetchTrendingRepositories(completionHanlder: @escaping ([TrendingItemModel]?) -> Void)
}

final class TrendingRepoViewModel: TrendingRepoViewModelType {
    var title: String { return  "Trending" }
    private(set) var trendingRepo: [TrendingItemModel] = []

    var service: APIServiceProtocol

    init(service : APIServiceProtocol = APIService()) {
        self.service = service
    }

    func fetchTrendingRepositories(completionHanlder: @escaping ([TrendingItemModel]?) -> Void) {
        service.fetchTrendingRepos {[weak self] result in
            switch result {
            case .success(let trendingRepo):
                self?.trendingRepo = trendingRepo.count > 0 ? trendingRepo : []
                completionHanlder(trendingRepo)
            case .failure(_):
                completionHanlder(nil)
            }
        }
    }
}
