@testable import SadaPayHomeAssignment
import XCTest

final class TrendingRepoViewModelTests: XCTestCase {

    func test_WhenInitiliazed_ThenTitleMatchWithResultValue() {
        let sut = TrendingRepoViewModel()
        let title = "Trending"
        XCTAssertEqual(sut.title, title)
    }

    func test_WhenInitilized_ThenTrendingItemCountIsZero() {
        let sut = TrendingRepoViewModel()
        let repo = sut.trendingRepo
        XCTAssertEqual(repo.count, 0 )
    }
}
