//
//  TableViewSkeletonDiffableDataSource.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 26/12/2022.
//

import Foundation
import UIKit
import SkeletonView
class TableViewSkeletonDiffableDataSource: UITableViewDiffableDataSource<Section, TrendingItemModel>, SkeletonTableViewDataSource {

    var cellIdentifier = RepoTableViewCell.identifier

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return cellIdentifier

    }

    func collectionSkeletonView(_ skeletonView: UITableView, prepareCellForSkeleton cell: UITableViewCell, at indexPath: IndexPath) {  }

    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
