//
//  MockTrendingRepoCellViewModel.swift
//  SadaPayHomeAssignmentTests
//
//  Created by Junaid on 25/12/2022.
//

import Foundation
@testable import SadaPayHomeAssignment

struct MockTrendingRepoCellViewModel: TrendingRepoCellViewModelType {

    var isExpand: Bool = true
    var name: String = TrendingItemModel.stub.name
    var ownerLogin: String = OwnerModel.stub.login
    var trendingRepositoryDescription: String = TrendingItemModel.stub.repoDescription
    var language: String = TrendingItemModel.stub.language ?? ""
    var stars: Int = TrendingItemModel.stub.starCount
    var avatarUrl: URL = URL(string: OwnerModel.stub.avatarUrl)!

    init(isExpand: Bool = true ) {
        self.isExpand = isExpand
    }
}
