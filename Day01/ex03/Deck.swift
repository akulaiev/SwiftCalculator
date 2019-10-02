
import Foundation

extension Array {
    mutating func shuffleArr() {
        let size: Int = self.count
        for i in 0...size - 1 {
            let j = Int(arc4random_uniform(UInt32(size - 1)))
            if i != j {
                self.swapAt(i, j)
            }
        }
    }
}

class Deck: NSObject {
    static let allSpades: [Card] = Value.allValues.map({Card(color: Color.Spades, value: $0)})
    static let allDiamonds: [Card] = Value.allValues.map({Card(color: Color.Diamonds, value: $0)})
    static let allHearts: [Card] = Value.allValues.map({Card(color: Color.Hearts, value: $0)})
    static let allClubs: [Card] = Value.allValues.map({Card(color: Color.Clubs, value: $0)})
    static let allCards: [Card] = allSpades + allDiamonds + allHearts + allClubs
}
