import Foundation
import XCTest

class BaseTest: XCTestCase {
    static let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        BaseTest.app.launch()
    }
    
    override func tearDown() {
        BaseTest.app.terminate()
        super.tearDown()
    }
}
