@testable import SadaPayHomeAssignment
import XCTest

final class APIServiceTests: XCTestCase {

    func testWhenValidEndPointProvided_WithActualCall_ThenFetchTopHeadlinesReturnSuccessResult() {
        let expectation = expectation(description: "Success Expectation")
        let sut = APIService()
        let stub = TrendingItemResult.stub.items
        let repo = stub.first
        let _ = sut.fetchTrendingRepos() { result in
            expectation.fulfill()
            switch result {
            case .success(let qoutesArray):
                XCTAssertTrue(qoutesArray.count > 0)
            case .failure(let failure):
                XCTFail("Success should be expected but got a failure \(failure)")
            }
        }

        waitForExpectations(timeout: 3.0)
    }


    func testWhenValidEndPointProvided_WithMockService_ThenFetchTopHeadlinesReturnSuccessResult() {
        let expectation = expectation(description: "Success Expectation")
        let sut = MockSuccessAPIService()
        let stub = TrendingItemResult.stub.items
        let repo = stub.first
        let _ = sut.fetchTrendingRepos() { result in
            expectation.fulfill()
            switch result {
            case .success(let qoutesArray):
                let expectedResult = qoutesArray.first
                XCTAssertEqual(expectedResult?.name, repo?.name)
                XCTAssertEqual(expectedResult?.repoDescription, repo?.repoDescription)
                XCTAssertEqual(expectedResult?.language, repo?.language)
                XCTAssertEqual(expectedResult?.starCount, repo?.starCount)
                XCTAssertEqual(expectedResult?.owner, repo?.owner)
                
            case .failure(let failure):
                XCTFail("Success should be expected but got a failure \(failure)")
            }
        }
        
        waitForExpectations(timeout: 1.0)
    }

    func testWhenInvalidEndpointProvided_ThenFetchTopHeadlinesReturnsFailureResult() {
        
        let expectation = expectation(description: "Failure Expectation")
        let sut = MockFailureAPIService()
        let _ = sut.fetchTrendingRepos { result in
            expectation.fulfill()
            switch result {
            case .success(let success):
                XCTFail("Failure should be expected but got a Success with \(success)")
                
            case .failure(let failure):
                XCTAssertEqual(failure, .NoDataFound)
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}
