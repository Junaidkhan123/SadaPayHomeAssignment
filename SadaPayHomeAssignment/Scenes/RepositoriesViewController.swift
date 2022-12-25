//
//  RepositoriesViewController.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 25/12/2022.
//

import UIKit

class RepositoriesViewController: UIViewController {

    private var viewModel: TrendingRepoViewModelType
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.title
    }

    init(viewModel: TrendingRepoViewModelType = TrendingRepoViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "RepositoriesViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
