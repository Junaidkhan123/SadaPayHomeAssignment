//
//  Coordinator.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 27/12/2022.
//

import UIKit
protocol Coordinator: AnyObject {
  var navigationController: UINavigationController { get set }
  func configureRootViewController()
  func showDetailViewController(with repoDesription: String)
}

class MainCoordinator: Coordinator {

    var navigationController: UINavigationController

    init(with _navigationController: UINavigationController) {
        self.navigationController = _navigationController
    }

    func configureRootViewController() {
        let repoViewController = RepositoriesViewController()
        repoViewController.coordinator = self
        self.navigationController.pushViewController(repoViewController, animated: false)
    }

    func showDetailViewController(with repoDesription: String) {
        let viewController = DetailViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
