
import Foundation

enum Valid: Equatable {
    case valid
    case invalid(_ errorMessage: ErrorMessages)
}

enum RegEx: String {
    case input = "^[COco]{2}$"
    case inputPredictor = "^[COco]{2}[0-9]+$"
    case retry = "^[YNyn]$"
}

enum ErrorMessages: String {
    case invalidInput = "Bad input: correct input should be of the form CC, where the two letters indicate [O]pen or [C]losed state for each hand."
    case invalidInputPredictor = "Bad input: correct input should be of the form CC3, where the first two letters indicate [O]pen or [C]losed state for each hand, followed by the prediction (0-4)."
    case invalidPrediction = "Bad input: prediction should be in the range of 0-4."
    case notPredictor = "Bad input: no prediction expected, you are not the predictor."
    case invalidRetry = "Bad input: expect y/n as response"
    
    func localized() -> String {
       return self.rawValue
    }
}

class Validator: NSObject {
    
    public static let validate = Validator()
    
    func isValidInput(_ text: String) -> Valid {
        
        if isValidRegEx(text, .input) {
            return .valid
        }
        if isValidRegEx(text, .inputPredictor) {
            return .invalid(.notPredictor)
        }
        return .invalid(.invalidInput)
            
    }
    
    func isValidInputPredictor(_ text: String) -> Valid {
        if isValidRegEx(text, .inputPredictor) {
            return isValidPrediction(text)
        }
        return .invalid(.invalidInputPredictor)
    }
    
    private func isValidPrediction(_ text: String) -> Valid {
        let index = text.index(text.startIndex, offsetBy: 2)
        let value = Int(text[index...])!
        if 0 <= value && value <= 4 {
            return .valid
        }
        return .invalid(.invalidPrediction)
    }
    
    func isValidRetry(_ text: String) -> Valid {
        if isValidRegEx(text, .retry) {
            return .valid
        }
        return .invalid(.invalidRetry)
    }
    
    private func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        //let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
        //let result = stringTest.evaluate(with: testStr)
        let match = testStr.range(of: regex.rawValue, options:.regularExpression)
        return match != nil
    }
}
