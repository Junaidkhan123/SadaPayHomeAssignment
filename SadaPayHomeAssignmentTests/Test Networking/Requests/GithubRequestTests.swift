@testable import SadaPayHomeAssignment
import XCTest

final class GithubRequestTests: XCTestCase {
    func test_WhenTrendingRequset_provided_ThenCreateValidURLRequest() throws {
        let sut = GithubRequest.searchRepository

        let request = try XCTUnwrap(sut.createURLRequest())
        let url = try XCTUnwrap(request.url)
        let components = try XCTUnwrap(URLComponents(url: url, resolvingAgainstBaseURL: true))

        XCTAssertEqual(components.host, "api.github.com")
        XCTAssertEqual(components.path, "/search/repositories")
        XCTAssertNotNil(components.queryItems)
        XCTAssertEqual(components.queryItems?.count,1)
        XCTAssertEqual(components.queryItems?.count,1)

        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(request.allHTTPHeaderFields, [:])
        //        expect(components.queryItems).to(equal([URLQueryItem(name: "q", value: "language=+sort:stars")]))
    }
}
