@testable import SadaPayHomeAssignment
import XCTest

final class OwnerModelTests: XCTestCase {

    func test_WhenInitilized_withAllProperties_ThenReturnsActualData() {

        let login = "apple"
        let avatar_url = "https://avatars.githubusercontent.com/u/12101536?v=4"

        let sut = OwnerModel(login: login,
                             avatar_url: avatar_url)
        XCTAssertEqual(sut.login,login)
        XCTAssertEqual(sut.avatar_url,avatar_url)
    }

}
