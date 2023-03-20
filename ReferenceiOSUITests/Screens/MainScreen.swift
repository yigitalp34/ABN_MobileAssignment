import Foundation
import XCTest

class MainScreen: Robot {
    
    lazy private var button = app.buttons["Button"].firstMatch
    lazy private var text = app.staticTexts.matching(identifier: "label").firstMatch
    
    @discardableResult
    func checkMainScreenDisplayedWithAllViewsByDefault() -> Self {
        XCTAssertTrue(expect(element: button, status: .hittable).isHittable)
        XCTAssertEqual(expect(element: text, status: .exist).label, "Hello")
        return self
    }
    
    @discardableResult
    func tapOnButton() -> Self {
        expect(element: button, status: .hittable).tap()
        return self
    }
    
    @discardableResult
    func checkTextIsChangedToTheEuroCurrencyValue() -> Self {
        XCTAssertTrue(expect(element: text, status: .exist).label.contains("€"))
        return self
    }
    
    @discardableResult
    func checkCurrencyValueRangeIsCorrect() -> Self {
        XCTAssertGreaterThanOrEqual(getConvertedNumericValue(), 100)
        XCTAssertLessThanOrEqual(getConvertedNumericValue(), 99999999)
        return self
    }
    
    private func getConvertedNumericValue() -> Int {
        let removableCharacters: Set<Character> = [" ", "€", "."]
        var numericValueWithoutCharacters = text.label
        numericValueWithoutCharacters.removeAll(where: { removableCharacters.contains($0) } )
        
        let expectedNumericValue = (numericValueWithoutCharacters as NSString).integerValue
        return expectedNumericValue
    }
    
}
