@testable import SadaPayHomeAssignment
import XCTest

final class TrendingItemModelTests: XCTestCase {

    func test_WhenInitilized_withAllProperties_ThenReturnsActualData() {

        let name = "swift"
        let repoDescription = "The Swift Programming Language"
        let language = "C#"
        let starCount = 514
        let sut = TrendingItemModel(name: name,
                                    repoDescription:repoDescription,
                                    language: language,
                                    starCount: starCount)
        XCTAssertEqual(sut.name, name)
        XCTAssertEqual(sut.repoDescription, repoDescription)
        XCTAssertEqual(sut.language, language)
        XCTAssertEqual(sut.starCount, starCount)

    }
}
