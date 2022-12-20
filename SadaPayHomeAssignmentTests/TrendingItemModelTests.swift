@testable import SadaPayHomeAssignment
import XCTest

final class TrendingItemModelTests: XCTestCase {

    func test_WhenInitilized_withName_ThenReturnsActualData() {
        let sut = TrendingItemModel(name: "swift")
        let title = "swift"
        XCTAssertEqual(sut.name, title)
    }

    func test_WhenInitliazed_WithNameAndDescription_ThenReturnsActualData() {
        let sut = TrendingItemModel(name: "swift", repoDescription: "The Swift Programming Language" )

        let title = "swift"
        let repoDescription = "The Swift Programming Language"
        XCTAssertEqual(sut.name, title)
        XCTAssertEqual(sut.repoDescription, repoDescription)


    }
}
