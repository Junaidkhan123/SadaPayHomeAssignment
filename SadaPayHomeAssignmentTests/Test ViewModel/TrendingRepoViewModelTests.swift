@testable import SadaPayHomeAssignment
import XCTest

final class TrendingRepoViewModelTests: XCTestCase {

    var sut: TrendingRepoViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = TrendingRepoViewModel(service: MockSuccessAPIService())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_WhenInitiliazed_ThenTitleMatchWithResultValue() {
        let title = "Trending"
        XCTAssertEqual(sut.title, title)
    }

    func test_WhenInitilized_ThenTrendingItemResultCountIsZero() {
        let repo = sut.trendingRepo
        XCTAssertEqual(repo.count, 0 )
    }

    func test_WhenFetchTrendingRepositoriesInvokedWithSucess_ThenTrendingItemResultCountIsNotNil() {

        let successExpectations = expectation(description: "Success Expectations for trendingRepositories")
        let stub: [TrendingItemModel] = TrendingItemResult.stub.items
        var outputRepositories: [TrendingItemModel]?
        sut.fetchTrendingRepositories { trendingRepo in
            successExpectations.fulfill()
            outputRepositories = trendingRepo
        }
        XCTAssertNotNil(outputRepositories)
        XCTAssertTrue(sut.trendingRepo.count > 0)
        XCTAssertEqual(stub, outputRepositories)
        waitForExpectations(timeout: 1.0)
    }

    func test_WhenFetchTrendingRepositoriesInvokedWithFailure_ThenTrendingItemResultIsNil() {
        let service = MockFailureAPIService()
        let sut = TrendingRepoViewModel(service: service)
        let faiulureExpectations = expectation(description: "Failure expectations for top trendingRepositories")

        var outputRepositories: [TrendingItemModel]?
        sut.fetchTrendingRepositories { articles in
            faiulureExpectations.fulfill()
            outputRepositories = articles
        }
        XCTAssertNil(outputRepositories)
        waitForExpectations(timeout: 1.0)
    }

}
