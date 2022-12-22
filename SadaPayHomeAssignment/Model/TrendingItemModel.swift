//
//  TrendingItemModel.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 21/12/2022.
//

import Foundation
struct TrendingItemModel: Hashable {
    let name: String
    let repoDescription: String
    let language: String?
    let starCount: Int
    let owner: OwnerModel
}
