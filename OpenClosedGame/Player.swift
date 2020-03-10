
let handState = ["O","C"]

public class Player {
    private var hands: String = ""
    
    func getHands() -> String {
        return hands
    }
    
    func setHands(_ hands: String){
        self.hands = hands
    }
    
    func countOpenHands() -> Int {
        return hands.filter{ $0 == "O" || $0 == "o"}.count
    }
}
