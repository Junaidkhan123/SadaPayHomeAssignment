@testable import SadaPayHomeAssignment
import XCTest

enum TrendingItemModelStrings {
    static var name = "swift"
    static var repoDescription = "The Swift Programming Language"
    static var language = "C#"
    static var starCount = 514
    static var owner = OwnerModel(login: "apple",
                                  avatarUrl: "https://avatars.githubusercontent.com/u/12101536?v=4")
}

final class TrendingItemModelTests: XCTestCase {

    func test_WhenInitilized_withAllProperties_ThenReturnsActualData() {

        let sut = makeSut(name: TrendingItemModelStrings.name,
                          repoDescription: TrendingItemModelStrings.repoDescription,
                          language: TrendingItemModelStrings.language,
                          starCount: TrendingItemModelStrings.starCount, owner: TrendingItemModelStrings.owner)

        XCTAssertEqual(sut.name, TrendingItemModelStrings.name)
        XCTAssertEqual(sut.repoDescription, TrendingItemModelStrings.repoDescription)
        XCTAssertEqual(sut.language, TrendingItemModelStrings.language)
        XCTAssertEqual(sut.starCount, TrendingItemModelStrings.starCount)
        XCTAssertEqual(sut.owner, TrendingItemModelStrings.owner)
    }

    func test_WhenInitilized_withNullLanguageProperty_ThenReturnsLanguagePropertyNull() {
        let sut = makeSut(name: TrendingItemModelStrings.name,
                          repoDescription: TrendingItemModelStrings.repoDescription,
                          starCount: TrendingItemModelStrings.starCount, owner: TrendingItemModelStrings.owner)

        XCTAssertNil(sut.language)
    }

     // MARK: - Helper method for making Sut
    func makeSut(name: String, repoDescription: String,language: String? = nil, starCount: Int, owner: OwnerModel ) -> TrendingItemModel{
        let model = TrendingItemModel(name: name,
                                      repoDescription:repoDescription,
                                      language: language,
                                      starCount: starCount,
                                      owner: owner)
        return model
    }
}
