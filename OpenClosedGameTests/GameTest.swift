
import XCTest

class GameTest: XCTestCase {
    
    var game = Game()
    
    override func setUp() {
        super.setUp()
        game = Game()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateNewGame() {
        XCTAssertTrue(game.isPlayerPredict)
        XCTAssertEqual(game.predictedNumber, 0)
    }
    
    func testGetHandsAndPrediction() {
        var (hands, prediction) = game.getHandsAndPrediction("OC4")
        XCTAssertEqual(hands, "OC")
        XCTAssertEqual(prediction, 4)
        
        (hands, prediction) = game.getHandsAndPrediction("CO1")
        XCTAssertEqual(hands, "CO")
        XCTAssertEqual(prediction, 1)
    }
    
    func testRandomPredict() {
        game.predictedNumber = -1
        game.setRandomPredict()
        
        XCTAssertGreaterThanOrEqual(game.predictedNumber, 0)
        XCTAssertLessThanOrEqual(game.predictedNumber, 4)
    }
    
    func testGetCorrectAnswer() {
        game.player.setHands("CC")
        game.bot.setHands("CC")
        XCTAssertEqual(game.getCorrectAnswer(), 0)
        
        game.player.setHands("OO")
        game.bot.setHands("OC")
        XCTAssertEqual(game.getCorrectAnswer(), 3)
    }
    
    func testReset() {
        game.isPlayerPredict = false
        game.reset()
        XCTAssertTrue(game.isPlayerPredict)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
