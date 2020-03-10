
import XCTest

class PlayerTests: XCTestCase {

    var p = Player()
    
    override func setUp() {
        super.setUp()
        p = Player()
    }
    
    func testCreateNewPlayer() {
        XCTAssertEqual(p.getHands(), "", "Cannot get hands")
    }
    
    func testSetHands() {
        XCTAssertEqual(p.getHands(), "")
        
        p.setHands("OC")
        XCTAssertEqual(p.getHands(), "OC")
        
        p.setHands("XX")
        XCTAssertEqual(p.getHands(), "XX")
    }

}
