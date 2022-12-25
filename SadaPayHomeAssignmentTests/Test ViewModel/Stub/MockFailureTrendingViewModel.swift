//
//  MockFailureTrendingViewModel.swift
//  SadaPayHomeAssignmentTests
//
//  Created by Junaid on 25/12/2022.
//

import Foundation
@testable import SadaPayHomeAssignment
final class MockFailureTrendingViewModel: TrendingRepoViewModelType {
    var title: String { return "Trending"}

    var trendingRepo: [SadaPayHomeAssignment.TrendingItemModel] = []

    func fetchTrendingRepositories(completionHanlder: @escaping ([TrendingItemModel]?) -> Void) {
        completionHanlder(nil)
    }
}
