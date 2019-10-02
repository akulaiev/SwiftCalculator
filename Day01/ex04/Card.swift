import Foundation

class Card: NSObject {
    let color: Color
    let value: Value
    
    init(color: Color, value: Value) {
        self.color = color
        self.value = value
        super.init()
    }
    
    override var description: String {
        return "Color: \(self.color), value: \(self.value)\n"
    }
    
    func isEqual(obj: Card) -> Bool {
        if obj.color == self.color && obj.value == self.value {
            return true
        }
        else {
            return false
        }
    }
    
    static func ==(first: Card, second: Card) -> Bool {
        if first.color == second.color && first.value == second.value {
            return true
        }
        else {
            return false
        }
    }
}
