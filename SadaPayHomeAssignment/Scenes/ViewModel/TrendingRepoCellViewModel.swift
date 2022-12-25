//
//  TrendingRepoCellViewModel.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 25/12/2022.
//

import Foundation
protocol TrendingRepoCellViewModelType {
    var isExpand: Bool { get set }
    var name: String { get }
    var ownerLogin: String { get }
    var trendingRepositoryDescription: String { get }
    var language: String { get }
    var stars: String { get }
    var avatarUrl: URL { get }
}

struct TrendingRepoCellViewModel: TrendingRepoCellViewModelType {
    var isExpand: Bool
    var name: String
    var ownerLogin: String
    var trendingRepositoryDescription: String
    var language: String
    var stars: String
    var avatarUrl: URL
    
}
