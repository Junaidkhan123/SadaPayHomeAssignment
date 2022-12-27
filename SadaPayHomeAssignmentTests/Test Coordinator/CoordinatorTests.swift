@testable import SadaPayHomeAssignment
import XCTest

final class CoordinatorTests: XCTestCase {

    func test_WhenConfigured_ThenRootViewControllerIsRepositoriesViewController() {

        let navigationViewController = UINavigationController()

        let sut = MainCoordinator(with: navigationViewController)

        sut.configureRootViewController()
        
        XCTAssertTrue(sut.navigationController.viewControllers.first is RepositoriesViewController)
    }
}
