import XCTest
@testable import swiftdom

class swiftdomTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(swiftdom.process())
    }

    static var allTests : [(String, (swiftdomTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
