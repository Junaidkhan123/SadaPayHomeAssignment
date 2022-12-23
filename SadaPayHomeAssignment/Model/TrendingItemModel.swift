//
//  TrendingItemModel.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 21/12/2022.
//

import Foundation
struct TrendingItemModel: Hashable, Decodable {
    let name: String
    let repoDescription: String
    let language: String?
    let starCount: Int
    let owner: OwnerModel

    enum CodingKeys: String, CodingKey {
        case name, owner, language
        case starCount = "stargazers_count"
        case repoDescription = "description"
    }
}
