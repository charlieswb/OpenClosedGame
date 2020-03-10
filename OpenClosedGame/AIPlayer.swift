
public class AIPlayer : Player {
    
    func randomHands(){
        self.setHands(handState.randomElement()! + handState.randomElement()!)
    }
    
}
