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
}
