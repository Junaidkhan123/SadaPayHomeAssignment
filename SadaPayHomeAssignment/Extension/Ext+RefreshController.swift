//
//  Ext+RefreshController.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 27/12/2022.
//

import UIKit
extension UIRefreshControl {
    func endRefreshing(delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.endRefreshing()
        }
    }
}
