
import XCTest

class AIPlayerTest: XCTestCase {
    
    var bot = AIPlayer()
    
    override func setUp() {
        super.setUp()
        bot = AIPlayer()
    }
    
    func testCreateNewBot() {
        XCTAssertEqual(bot.getHands(), "", "Cannot get hands")
    }
    
    func testSetHands() {
        XCTAssertEqual(bot.getHands(), "")
        
        bot.setHands("OC")
        XCTAssertEqual(bot.getHands(), "OC")
        
        bot.setHands("XX")
        XCTAssertEqual(bot.getHands(), "XX")
    }

}
