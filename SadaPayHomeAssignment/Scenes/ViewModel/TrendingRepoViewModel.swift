//
//  TrendingRepoViewModel.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 24/12/2022.
//

import Foundation
final class TrendingRepoViewModel {
    var title: String { return  "Trending" }
    private(set) var trendingRepo: [TrendingItemModel] = []
}
