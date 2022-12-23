//
//  OwnerModel.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 21/12/2022.
//

import Foundation
struct OwnerModel: Hashable, Decodable {
    let login: String
    let avatarUrl: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}
