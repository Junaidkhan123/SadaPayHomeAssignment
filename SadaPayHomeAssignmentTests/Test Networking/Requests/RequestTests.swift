@testable import SadaPayHomeAssignment
import XCTest

final class RequestTests: XCTestCase {

    var sut: RequestStub!

    override func setUpWithError() throws {
        sut = RequestStub.acceptableEndPoint
    }
    override func tearDown() async throws {
        sut = nil
    }

    func test_WhenAcceptableEndpoints_provided_ThenURLRequestIsNotNil() {
        sut = .acceptableEndPoint
        let request = sut.createURLRequest()
        XCTAssertNotNil(request)
    }

    func test_WhenAcceptableEndpoints_provided_ThenCreatedURLRequestIsValid() throws {
        sut = .acceptableEndPoint
        let request = try XCTUnwrap(sut.createURLRequest())
        let url = try XCTUnwrap(request.url)
        let components = try XCTUnwrap(URLComponents(url: url, resolvingAgainstBaseURL: true))

        XCTAssertEqual(components.path, "/v1")
        XCTAssertEqual(components.host, "google.com")
        XCTAssertEqual(components.queryItems?.count, 1)
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(request.allHTTPHeaderFields, ["requestHeader": "requestHeader"])
    }

    func test_WhenUnAcceptableEndpoints_provided_ThenURLRequestInNil()  {
        sut = .unAcceptableEndPoint
        let urlRequest = sut.createURLRequest()
        XCTAssertNil(urlRequest)
    }
}
