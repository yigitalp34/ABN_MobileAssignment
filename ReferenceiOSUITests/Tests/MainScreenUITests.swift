import XCTest

final class MainScreenUITests: BaseTest {
    
    func test_whenAppIsLaunched_thenExpectedViewsAreDisplayed() {
        MainScreen()
            .checkMainScreenDisplayedWithAllViewsByDefault()
    }
    
    func test_givenAppIsLaunched_whenButtonIsClicked_thenCheckWhetherTextIsChangedToTheCurrencyValue() {
        MainScreen()
            .tapOnButton()
            .checkTextIsChangedToTheEuroCurrencyValue()
    }
    
    func test_givenAppIsLaunched_whenButtonIsClicked_thenCheckNumericValueRangeIsCorrect() {
        MainScreen()
            .tapOnButton()
            .checkCurrencyValueRangeIsCorrect()
    }
    
    func test_givenDeviceOrientationIsLandscape_whenButtonIsClicked_thenExpectedViewsAreDisplayed() {
        XCUIDevice.shared.orientation = .landscapeLeft
        MainScreen()
            .checkMainScreenDisplayedWithAllViewsByDefault()
            .tapOnButton()
            .checkCurrencyValueRangeIsCorrect()
        
        XCUIDevice.shared.orientation = .portrait
        MainScreen()
            .checkTextIsChangedToTheEuroCurrencyValue()
    }
}
