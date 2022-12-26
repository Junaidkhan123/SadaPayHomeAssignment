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

    func test_WhenTableViewIsConfigured_ThenRepoTableViewCellReturnsCorrectdata() throws {
        let tableView = try XCTUnwrap(sut.tableView)

        let cell = try XCTUnwrap(
            tableView.cell(at: 0)
        )

        let stub = MockTrendingRepoCellViewModel()
        XCTAssertNotNil(cell)
        XCTAssertEqual(tableView.ownerName(at: 0), stub.ownerLogin)
        XCTAssertEqual(tableView.repositoryName(at: 0), stub.name)
        XCTAssertEqual(tableView.repoDescription(at: 0), stub.trendingRepositoryDescription)
        XCTAssertEqual(tableView.language(at: 0), stub.language)
        XCTAssertEqual(tableView.starCount(at: 0), "\(stub.stars)")
        XCTAssertTrue(tableView.isDescriptionLabelHidden(at: 0))
        XCTAssertTrue(tableView.isStackViewHidden(at: 0))

    }

    func test_WhenDataIsFetchedSuccessFully_ThenReturnsCorrectNumberOfRows() throws {
        let mockSuccessViewModel = MockSuccessTrendingViewModel()
        let sut = makeSut(viewModel: mockSuccessViewModel)
        
        mockSuccessViewModel.fetchTrendingRepositories { repositories in
            XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), repositories?.count)
        }
    }

    func test_WhenTableViewCellSelected_ThenNotifiesDelegate() throws {
        let mockSuccessViewModel = MockSuccessTrendingViewModel()
        let sut = makeSut(viewModel: mockSuccessViewModel)
        let tableView = try XCTUnwrap(sut.tableView)

        let _ = try XCTUnwrap(
            tableView.cell(at: 0)
        )

        sut.tableView.select(at: 0)
        XCTAssertEqual(sut.tableView.isDescriptionLabelHidden(at: 0), true)

    }

    func test_WhenDataFetchingFailed_ThenItReturnsNilRepositories() throws {
        let mockFailureViewModel = MockFailureTrendingViewModel()
        let _ = makeSut(viewModel: mockFailureViewModel)

        mockFailureViewModel.fetchTrendingRepositories { repositories in
            XCTAssertNil(repositories)
        }
    }

    // MARK: - ErrorView Tests
    func test_WhenInitiliazed_ThenControllerHasErrorView() {
        XCTAssertNotNil(sut.errorView)
    }

    func test_WhenDataFetchingFailed_ThenErrorViewIsVisible() throws {
        let mockFailureViewModel = MockFailureTrendingViewModel()
        let _ = makeSut(viewModel: mockFailureViewModel)
        
        mockFailureViewModel.fetchTrendingRepositories { _ in }
        
        XCTAssertEqual(false, sut.errorView.isHidden)
    }


    // MARK: - Helper
    func makeSut(viewModel: TrendingRepoViewModelType = MockSuccessTrendingViewModel()) -> RepositoriesViewController {
        let sut = RepositoriesViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
        return sut
    }
}

private extension UITableView {

    func cell(at row: Int) -> RepoTableViewCell {
        return dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: 0)) as! RepoTableViewCell
    }

    func ownerName(at row: Int) -> String? {
        cell(at: row).ownerNameLabel?.text
    }

    func repositoryName(at row: Int) -> String? {
        cell(at: row).repositoryNameLabel?.text
    }

    func repoDescription(at row: Int) -> String? {
        cell(at: row).repoDescriptionLabel?.text
    }

    func language(at row: Int) -> String? {
        cell(at: row).languageLabel?.text
    }

    func starCount(at row: Int) -> String? {
        cell(at: row).starsCountLabel?.text
    }

    func isDescriptionLabelHidden(at row: Int) -> Bool {
        cell(at: row).repoDescriptionLabel.isHidden
    }

    func isStackViewHidden(at row: Int) -> Bool {
        cell(at: row).stackView.isHidden
    }

    func select(at row: Int) {
        delegate?.tableView?(self, didSelectRowAt: IndexPath(row: row, section: 0))
    }
}
