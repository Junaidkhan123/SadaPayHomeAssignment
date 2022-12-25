//
//  RepositoriesViewController.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 25/12/2022.
//

import UIKit

class RepositoriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var viewModel: TrendingRepoViewModelType
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.title
        setupTableView()
    }

    init(viewModel: TrendingRepoViewModelType = TrendingRepoViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "RepositoriesViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTableView() {
        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: RepoTableViewCell.identifier)
    }

}
