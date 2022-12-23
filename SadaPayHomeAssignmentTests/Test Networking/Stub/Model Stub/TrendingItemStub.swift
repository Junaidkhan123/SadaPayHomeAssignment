//
//  TrendingItemStub.swift
//  SadaPayHomeAssignmentTests
//
//  Created by Junaid on 23/12/2022.
//

import Foundation
@testable import SadaPayHomeAssignment
extension TrendingItemModel {
    static let stub: TrendingItemModel = .init(name: "swift",
                                               repoDescription: "The Swift Programming Language",
                                               language: "C#", starCount: 514,
                                               owner: OwnerModel.stub)
}
