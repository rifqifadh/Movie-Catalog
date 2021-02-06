import XCTest
@testable import DetailMovie

final class DetailMovieTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DetailMovie().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
