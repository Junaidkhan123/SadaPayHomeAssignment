@testable import SadaPayHomeAssignment
import XCTest

final class RepositoriesViewControllerTests: XCTestCase {

    func test_WhenIntiliazed_ThenTitleShouldSets() {
        let sut = RepositoriesViewController()
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.title, "Trending")
    }

    // MARK: - TableView Tests
    func test_WhenControllerLoaded_ThenControllerHasTableView() {
        let sut = RepositoriesViewController()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView)
    }

    func test_whenTableViewIsConfigured_ThenTableViewHasCell() {
        let sut = RepositoriesViewController()
        sut.loadViewIfNeeded()
        let cell = sut.tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier, for: IndexPath(item: 0, section: 0))
        XCTAssertNotNil(cell)
    }
}
