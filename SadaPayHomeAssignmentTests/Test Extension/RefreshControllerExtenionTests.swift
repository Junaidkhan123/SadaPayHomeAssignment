@testable import SadaPayHomeAssignment
import XCTest

final class RefreshControllerExtenionTests: XCTestCase {
    func test_WhenEndRefreshingCalledAfterDelay_ThenisRefreshingShouldFalse() {

        let refreshControl = UIRefreshControl()
        let timeDelay: TimeInterval = 1.0
        let expectation = self.expectation(description: "Refresh control should end refreshing after delay")

        refreshControl.endRefreshing(delay: timeDelay)

        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
            XCTAssertFalse(refreshControl.isRefreshing)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1.01)
    }
}
