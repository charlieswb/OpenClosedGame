
import XCTest

class ValidatorTest: XCTestCase {
    
    func testIsValidInput() {
        XCTAssertEqual(Validator.validate.isValidInput("oc"), .valid)
        XCTAssertEqual(Validator.validate.isValidInput("chicken"), .invalid(.invalidInput))
        XCTAssertEqual(Validator.validate.isValidInput("OO5"), .invalid(.notPredictor))
    }
    
    func testIsValidInputPredictor() {
        XCTAssertEqual(Validator.validate.isValidInputPredictor("CO2"), .valid)
        XCTAssertEqual(Validator.validate.isValidInputPredictor("whale"), .invalid(.invalidInputPredictor))
        XCTAssertEqual(Validator.validate.isValidInputPredictor("cc20"), .invalid(.invalidPrediction))
    }
    
    func testIsValidRetry() {
        XCTAssertEqual(Validator.validate.isValidRetry("y"), .valid)
        XCTAssertEqual(Validator.validate.isValidRetry("yes"), .invalid(.invalidRetry))
    }

}
