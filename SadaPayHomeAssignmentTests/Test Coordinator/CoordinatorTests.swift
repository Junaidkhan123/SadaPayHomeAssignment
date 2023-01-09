@testable import SadaPayHomeAssignment
import XCTest

final class CoordinatorTests: XCTestCase {

    func test_WhenConfigured_ThenRootViewControllerIsRepositoriesViewController() {

        let navigationViewController = UINavigationController()

        let sut = MainCoordinator(with: navigationViewController)

        sut.configureRootViewController()
        
        XCTAssertTrue(sut.navigationController.viewControllers.first is RepositoriesViewController)
    }

    func test_WhenShowDetailScreenCalled_ThenDestinationViewController_IsDetailViewController() {


        let navigationViewController = MockNavigationController()

        let sut = MainCoordinator(with: navigationViewController)

        sut.configureRootViewController()

        sut.showDetailViewController(with: "Repo with some description")

        //XCTAssertTrue(navigationViewController.viewControllers.last is DetailViewController)
        XCTAssertTrue(navigationViewController.pushedViewController is DetailViewController)
    }
}

class MockNavigationController: UINavigationController {

    var pushedViewController: UIViewController?
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
    }
}
