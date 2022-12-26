//
//  TrendingItemModel.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 21/12/2022.
//

import Foundation
class TrendingItemModel: Hashable, Decodable {

    let identifier = UUID()
    var isCollapsed: Bool = true
    let name: String
    let repoDescription: String
    let language: String?
    let starCount: Int
    let owner: OwnerModel

    init(isCollapsed: Bool = true, name: String, repoDescription: String, language: String?, starCount: Int, owner: OwnerModel) {
        self.isCollapsed = isCollapsed
        self.name = name
        self.repoDescription = repoDescription
        self.language = language
        self.starCount = starCount
        self.owner = owner
    }
    
    enum CodingKeys: String, CodingKey {
        case name, owner, language
        case starCount = "stargazers_count"
        case repoDescription = "description"
    }

    static func == (lhs: TrendingItemModel, rhs: TrendingItemModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
