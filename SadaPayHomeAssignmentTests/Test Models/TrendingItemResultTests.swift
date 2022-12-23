@testable import SadaPayHomeAssignment
import XCTest

final class TrendingItemResultTests: XCTestCase {

    func test_WhenInitilized_ThenReturnsActualData() {

        let trendingItem: [TrendingItemModel] = [
            .init(name: TrendingItemModelStrings.name,
                  repoDescription:TrendingItemModelStrings.repoDescription,
                  language: TrendingItemModelStrings.language,
                  starCount: TrendingItemModelStrings.starCount,
                  owner: TrendingItemModelStrings.owner)
        ]

        let sut = TrendingItemResult(items: trendingItem)
        let item = sut.items.first

        XCTAssertEqual(sut.items.count, 1)
        XCTAssertEqual(item?.name, TrendingItemModelStrings.name)
        XCTAssertEqual(item?.repoDescription, TrendingItemModelStrings.repoDescription)
        XCTAssertEqual(item?.language, TrendingItemModelStrings.language)
        XCTAssertEqual(item?.starCount, TrendingItemModelStrings.starCount)
        XCTAssertEqual(item?.owner, TrendingItemModelStrings.owner)

    }
}
