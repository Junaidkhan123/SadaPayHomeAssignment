@testable import SadaPayHomeAssignment
import XCTest

final class TrendingItemModelTests: XCTestCase {

    func test_WhenInitilized_withName_ThenReturnsActualData() {
        let sut = TrendingItemModel(name: "swift")
        let title = "swift"
        XCTAssertEqual(sut.name, title)
    }
}
