@testable import SadaPayHomeAssignment
import XCTest

final class RequestTests: XCTestCase {

    func test_WhenAcceptableEndpoints_provided_ThenURLRequstIsNotNil() {
        let sut: RequestStub = .acceptableEndPoint
        let request = sut.createURLRequest()
        XCTAssertNotNil(request)
    }

    func test_WhenAcceptableEndpoints_provided_ThenCreatedURLRequestIsValid() throws {
        let sut: RequestStub = .acceptableEndPoint
        let request = try XCTUnwrap(sut.createURLRequest())
        let url = try XCTUnwrap(request.url)
        let components = try XCTUnwrap(URLComponents(url: url, resolvingAgainstBaseURL: true))

        XCTAssertEqual(components.path, "/v1")
        XCTAssertEqual(components.host, "google.com")
        XCTAssertEqual(components.queryItems?.count, 1)
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(request.allHTTPHeaderFields, ["requestHeader": "requestHeader"])
    }
}
