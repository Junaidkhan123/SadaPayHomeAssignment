@testable import SadaPayHomeAssignment
import XCTest

final class RepositoriesViewControllerTests: XCTestCase {

    var sut: RepositoriesViewController!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = makeSut()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_WhenIntiliazed_ThenTitleShouldSets() {
        XCTAssertEqual(sut.title, "Trending")
    }

    // MARK: - TableView Tests
    func test_WhenControllerLoaded_ThenControllerHasTableView() {
        XCTAssertNotNil(sut.tableView)
    }

    func test_WhenTableViewIsConfigured_ThenTableViewHasCell() {
        let cell = sut.tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier, for: IndexPath(item: 0, section: 0))
        XCTAssertNotNil(cell)
    }

    func test_WhenTableViewIsConfigured_ThenRepoTableViewCellReturns() throws {
        let tableView = try XCTUnwrap(sut.tableView)
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = try XCTUnwrap(
            tableView.dataSource?
                .tableView(tableView,
                           cellForRowAt: indexPath)
            as? RepoTableViewCell
        )
        XCTAssertNotNil(cell)
    }

    func test_WhenDataIsFetchedSuccessFully_ThenReturnsCorrectNumberOfRows() throws {
        let mockSuccessViewModel = MockSuccessTrendingViewModel()
        let sut = makeSut(viewModel: mockSuccessViewModel)
        
        mockSuccessViewModel.fetchTrendingRepositories { repositories in
            XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), repositories?.count)
        }
    }

    func test_WhenDataFetchingFailed_ThenItReturnsNilRepositories() throws {
        let mockFailureViewModel = MockFailureTrendingViewModel()
        let _ = makeSut(viewModel: mockFailureViewModel)

        mockFailureViewModel.fetchTrendingRepositories { repositories in
            XCTAssertNil(repositories)
        }
    }

    // MARK: - Helper
    func makeSut(viewModel: TrendingRepoViewModelType = MockSuccessTrendingViewModel()) -> RepositoriesViewController {
        let sut = RepositoriesViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
        return sut
    }

}
