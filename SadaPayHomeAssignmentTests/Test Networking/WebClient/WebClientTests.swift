@testable import SadaPayHomeAssignment
import XCTest

final class WebClientTests: XCTestCase {

     // MARK: - Tests
    func test_WhenWebClientExecutesWithStatusCode200_ThenItShouldReturnValidData() {
        let data = convertjsonStringToData(for: "{ \"name\": \"Junaid\" }")
        let result = callWebClientCompletionHandler(data: data,
                                                    statusCode: 200)

        XCTAssertEqual(result, .success(MockSessionStruct(name: "Junaid")))
    }

    func test_WhenWebClientExecutesWithStatusCode200_ThenItShouldReturncorrupetDataAPiError() {
        let data = convertjsonStringToData(for: "{ \"ame\": \"Junaid\" }")
        let result = callWebClientCompletionHandler(data: data,
                                                    statusCode: 200)

        XCTAssertEqual(result, .failure(.corrupetData))
    }

    func test_WhenWebClientExecutesWithStatus200_ThenItShouldReturnNoDataFound() {
        let result = callWebClientCompletionHandler(data: nil,
                                                    statusCode: 200)

        XCTAssertEqual(result, .failure(.NoDataFound))
    }

    func test_WhenWebClientExecutesWithStatus200_ThenItShouldReturnInvalidURL() {
        let result = callWebClientCompletionHandler(endpoint: .unAcceptableEndPoint,
                                                    data: nil,
                                                    statusCode: 200)

        XCTAssertEqual(result, .failure(.invalidURL))
    }

    func test_WhenWebClientExecutesWithStatus400_ThenItShouldBadRequestError() {
        let data = convertjsonStringToData(for: "{ \"name\": \"Junaid\" }")
        let result = callWebClientCompletionHandler(endpoint: .acceptableEndPoint,
                                                    data: data,
                                                    statusCode: 400)

        XCTAssertEqual(result, .failure(.badRequest("Bad URL Request error!")))
    }

    func test_WhenWebClientExecutesWithStatus500_ThenItShouldBadRequestError() {
        let data = convertjsonStringToData(for: "{ \"name\": \"Junaid\" }")
        let result = callWebClientCompletionHandler(endpoint: .acceptableEndPoint,
                                                    data: data,
                                                    statusCode: 500)

        XCTAssertEqual(result, .failure(.serverError("something went wrong")))
    }

    // MARK: - Helper Method
   func callWebClientCompletionHandler(endpoint: RequestStub = .acceptableEndPoint, data: Data?, statusCode: Int) -> Result<MockSessionStruct,APIError>? {

       var actualResult: Result<MockSessionStruct,APIError>?

       let mockURLSessionTask = MockURLSessionDataTask()
       let session = MockURLSession()
       session.dataTaskReturnValue = mockURLSessionTask

       let dummyURL = URL(string: "dummy")!
       let sut   = MockWebClient()
       sut.execute(session: session,
                   endPoint: endpoint,
                   responseModel: MockSessionStruct.self,
                   decoder: .init()) { newsResutl in

           actualResult  = newsResutl

       }

       session.completionHandler(data,
                                 HTTPURLResponse(url: dummyURL,
                                                 statusCode: statusCode,
                                                 httpVersion: nil,
                                                 headerFields: nil),
                                 nil)

       return actualResult
   }

    func convertjsonStringToData(for jsonString: String) -> Data {
        return Data(jsonString.utf8)
    }

     // MARK: - MockWebClient
    class MockWebClient: WebClient {}
}

struct MockSessionStruct: Decodable, Equatable {
    var name: String
}

// MARK: - Mock URLSession
class MockURLSession: URLSessionProtocol {

    var dataTaskReturnValue: URLSessionDataTask!
    var dataTaskCallCount = 0
    var dataTaskRequest: URLRequest?
    var completionHandler: (Data?, URLResponse?, Error?) -> Void = { _, _ , _ in }
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCallCount += 1
        dataTaskRequest = request
        self.completionHandler = completionHandler
        return dataTaskReturnValue
    }
}

// MARK: - Mock URLSessionDataTask
final class MockURLSessionDataTask: URLSessionDataTask {
    private var resumeCallCount = 0
    override func resume() {
        resumeCallCount += 1
    }
}

