var testDeck = Deck(sorted: false)
print("Lets create and print the deck!\n \(testDeck)")
print("Deck's size: \(testDeck.cards.count)")

print("\nNow let's draw three cards from the deck:")
var someCard: Card?
someCard = testDeck.draw()
print(someCard!)
someCard = testDeck.draw()
print(someCard!)
someCard = testDeck.draw()
print(someCard!)
someCard = nil

for i in testDeck.outs {
    testDeck.fold(c: i)
}
print("\nTime to fold and print the discards:")
for i in testDeck.discards {
    print(i)
}

print("\nAnd finally, let's print the deck's size again")
print("Deck's size: \(testDeck.cards.count)")
