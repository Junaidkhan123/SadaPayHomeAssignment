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
        tableView.delegate = self
    }

    private func configureDataSource() -> UITableViewDiffableDataSource<Section, TrendingItemModel> {

        let dataSource = TableViewSkeletonDiffableDataSource(tableView: tableView, cellProvider: { [weak self]  (tableView, indexPath, itemIdentifier) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier, for: indexPath) as! RepoTableViewCell
            let viewModel = self?.viewModel.getTrendingCellViewModel(at: indexPath.row)
            cell.configCell(with: viewModel!)
            return cell
        })
        dataSource.defaultRowAnimation = .fade
        return dataSource
    }

    private func fetchRepositories() {
        showShimmer()
        viewModel.fetchTrendingRepositories {  [weak self] result in
            guard let self = self else { return }
            self.hideShimmer()
            if result == nil {
            }
            else {
                self.hideShimmer()
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

    private func showShimmer() {
        tableView.showTableViewSkeleton()
    }

    private func hideShimmer() {
        tableView.hideTableViewSkeleton()
    }
}

 // MARK: - TableView Delegate Method
extension RepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let selectedItemIdentifier = self.dataSource.itemIdentifier(for: indexPath) else { return }
        selectedItemIdentifier.isCollapsed.toggle()

        var viewModel = viewModel.getTrendingCellViewModel(at: indexPath.row)
        viewModel.isCollapsed = selectedItemIdentifier.isCollapsed

        var newSnapshot = dataSource.snapshot()
        newSnapshot.reloadItems([selectedItemIdentifier])
        dataSource.apply(newSnapshot)
    }
}
