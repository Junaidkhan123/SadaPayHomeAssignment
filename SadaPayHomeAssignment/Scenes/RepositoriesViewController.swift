//
//  RepositoriesViewController.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 25/12/2022.
//

import UIKit
enum Section {
    case trendingRepositories
}

class RepositoriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private lazy var dataSource = configureDataSource()
    private var viewModel: TrendingRepoViewModelType

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.title
        setupTableView()
        fetchRepositories()
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
        tableView.dataSource = dataSource
    }

    private func configureDataSource() -> UITableViewDiffableDataSource<Section, TrendingItemModel> {

        let dataSource = UITableViewDiffableDataSource<Section, TrendingItemModel>(tableView: tableView, cellProvider: { (tableView, indexPath, trendingItemModel) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier, for: indexPath) as! RepoTableViewCell
            return cell
        })

        return dataSource
    }

    private func fetchRepositories() {
        viewModel.fetchTrendingRepositories {  [weak self] result in
            guard let self = self else { return }
            if result == nil {
            }
            else {
                self.updateSnapShot(trendingItems: result!)
            }
        }
    }

    private func updateSnapShot(trendingItems: [TrendingItemModel]) {
        var snapShot = NSDiffableDataSourceSnapshot<Section, TrendingItemModel>()
        snapShot.appendSections([.trendingRepositories])
        snapShot.appendItems(trendingItems)
        dataSource.apply(snapShot)
    }
}
