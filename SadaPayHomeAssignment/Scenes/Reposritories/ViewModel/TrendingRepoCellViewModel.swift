//
//  TrendingRepoCellViewModel.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 25/12/2022.
//

import Foundation
protocol TrendingRepoCellViewModelType {
    var isCollapsed: Bool { get set }
    var name: String { get }
    var ownerLogin: String { get }
    var trendingRepositoryDescription: String { get }
    var language: String { get }
    var stars: String { get }
    var avatarUrl: URL { get }
}

class TrendingRepoCellViewModel: TrendingRepoCellViewModelType {
    var isCollapsed: Bool = true
    var name: String
    var ownerLogin: String
    var trendingRepositoryDescription: String
    var language: String
    var stars: String
    var avatarUrl: URL

    init(isCollapsed: Bool, name: String, ownerLogin: String, trendingRepositoryDescription: String, language: String, stars: String, avatarUrl: URL) {
        self.isCollapsed = isCollapsed
        self.name = name
        self.ownerLogin = ownerLogin
        self.trendingRepositoryDescription = trendingRepositoryDescription
        self.language = language
        self.stars = stars
        self.avatarUrl = avatarUrl
    }
    
}
