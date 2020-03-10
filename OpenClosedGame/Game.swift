

public class Game {
    var isPlayerPredict: Bool
    var predictedNumber: Int
    var player: Player
    var bot: AIPlayer
    
    init(){
        isPlayerPredict = true
        predictedNumber = 0
        player = Player()
        bot = AIPlayer()
    }
    
    func reset() {
        isPlayerPredict = true
        predictedNumber = 0
    }
    
    func start() {
        print("Welcome to the game!")
        repeat {
            reset()
            play()
        } while (retry())
        print("Ok, bye!")
    }
    
    func play(){
        gameloop: repeat{
            playOneRound()
            
            //check winner
            if predictedNumber == getCorrectAnswer(){
                if isPlayerPredict {
                    print("YOU WIN!!!")
                } else{
                    print("AI wins.")
                }
                break gameloop
            }
            
            print("No winner.")
            isPlayerPredict = !isPlayerPredict
        }while (true)
    }
    
    func playOneRound(){
        if isPlayerPredict {
            //player
            let answer = askPredictor()
            player.setHands(answer.hands)
            predictedNumber = answer.prediction
            
            //bot
            bot.randomHands()
            print("AI: \(bot.getHands())")
        } else {
            //player
            let answer = askPlayer()
            player.setHands(answer)
            
            //bot
            bot.randomHands()
            setRandomPredict()
            print("AI: \(bot.getHands())" + "\(predictedNumber)")
        }
    }
    
    func setRandomPredict(){
        predictedNumber = Int.random(in: 0...4)
    }
    
    func askPredictor() -> (hands: String, prediction: Int){
        repeat {
            print("You are the predictor, what is your input?")
            print("Player: ", terminator: "")
            
            let input = readLine()!
            let isInputValid = Validator.validate.isValidInputPredictor(input)
            switch isInputValid{
            case .valid:
                return getHandsAndPrediction(input)
            case .invalid(let message):
                print(message.localized())
            }
            
        } while (true)
    }
    
    func askPlayer() -> String {
        repeat {
            print("AI is the predictor, what is your input?")
            print("Player: ", terminator: "")
            let input = readLine()!
            
            let isValid = Validator.validate.isValidInput(input)
            switch isValid{
            case .valid:
                return input
            case .invalid(let message):
                print(message.localized())
            }
            
        } while (true)
    }
    
    func retry() -> Bool {
        repeat {
            print("Do you want to play again? (y/n)")
            
            let retry = readLine()!
            let valid = Validator.validate.isValidRetry(retry)
            switch  valid{
            case .valid:
                if retry == "y" || retry == "Y"  {
                    return true
                }
                return false
            case .invalid(let message):
                print(message.localized())
            }
            
        } while (true)
    }
    
    func getHandsAndPrediction(_ input: String) -> (String, Int) {
        let index = input.index(input.startIndex, offsetBy: 2)
        let hands = String(input[..<index])
        let prediction = Int(input[index...])!
        return (hands, prediction)
    }
    
    func getCorrectAnswer() -> Int {
        var openHandsCounter = 0
        openHandsCounter += player.countOpenHands() + bot.countOpenHands()
        //print("openHand = \(openHandsCounter)")
        return openHandsCounter
    }
}
