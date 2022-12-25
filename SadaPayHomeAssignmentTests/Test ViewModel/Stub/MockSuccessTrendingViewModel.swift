//
//  MockSuccessTrendingViewModel.swift
//  SadaPayHomeAssignmentTests
//
//  Created by Junaid on 25/12/2022.
//

import Foundation
@testable import SadaPayHomeAssignment
final class MockSuccessTrendingViewModel: TrendingRepoViewModelType {
    var title: String { return "Trending"}

    var trendingRepo: [TrendingItemModel] = []

    func fetchTrendingRepositories(completionHanlder: @escaping ([TrendingItemModel]?) -> Void) {
        trendingRepo = TrendingItemResult.stub.items
        completionHanlder(TrendingItemResult.stub.items)
    }
}
