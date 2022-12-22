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

        let sut = TrendingItemResult(item: trendingItem)
        let item = sut.item.first

        XCTAssertEqual(sut.item.count, 1)
        XCTAssertEqual(item?.name, TrendingItemModelStrings.name)
        XCTAssertEqual(item?.repoDescription, TrendingItemModelStrings.repoDescription)
        XCTAssertEqual(item?.language, TrendingItemModelStrings.language)
        XCTAssertEqual(item?.starCount, TrendingItemModelStrings.starCount)
        XCTAssertEqual(item?.owner, TrendingItemModelStrings.owner)

    }
}
