//
//  Made with ❤ and ☕ 
//

import XCTest
@testable import searchify_sf5

class searchify_sf5Tests: XCTestCase {

    func testBaseURLLoadsCorrectURL() {
    
        let url = URL(string: "https://api.spotify.com/v1")!
        let sut = Music(with: url)
        let mockURLSession = URLSessionMock()
        let expectation = XCTestExpectation(description: "Testing Mock API")
        
        sut.fetch(with: mockURLSession) {
            XCTAssertEqual(mockURLSession.lastURL, url)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)
    }
    
    func testNewReleasesFetchCallsResume() {
        
        let url = URL(string: "https://api.spotify.com/v1/browse/new-releases")!
        let sut = Music(with: url)
        let mockURLSession = URLSessionMock()
        let expectation = XCTestExpectation(description: "Downloading New Releases")
        
        sut.fetch(with: mockURLSession) {
            XCTAssertTrue(mockURLSession.dataTask?.hasStarted ?? false)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }

}
