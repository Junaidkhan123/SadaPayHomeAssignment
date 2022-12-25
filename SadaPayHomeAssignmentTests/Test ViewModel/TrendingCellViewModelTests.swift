@testable import SadaPayHomeAssignment
import XCTest

final class TrendingCellViewModelTests: XCTestCase {

    func test_WhenTrendingRepoCellViewModel_isExpands_ThenIsExpandReturnsTrue() {
        let sut = MockTrendingRepoCellViewModel()

        XCTAssertTrue(sut.isExpand)
    }

    func test_WhenTrendingRepoCellViewModel_isExpandsSetsFalse_ThenIsExpandReturnsFalse() {
        let sut = MockTrendingRepoCellViewModel(isExpand: false)

        XCTAssertFalse(sut.isExpand)
    }
}
