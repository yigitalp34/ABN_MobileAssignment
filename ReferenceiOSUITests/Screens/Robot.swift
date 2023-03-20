import Foundation
import XCTest

class Robot {
    
    lazy var app = BaseTest.app
        
    @discardableResult
    func expect(element: XCUIElement, status: UIStatus, timeout: TimeInterval = Timeouts.defaultTimeout, message: String? = nil) -> XCUIElement {
        let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: status.rawValue), object: element)
        let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
        if result == .timedOut {
            XCTFail(message ?? expectation.description)
        }
        return element
    }
}
