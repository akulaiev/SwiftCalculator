print("Let's print allSpades from the Deck!")
var count: Int = 1
for elem in Deck.allSpades {
    print("\(count). \(elem)")
    count += 1
}
print("\n")
print("Now let's shuffle them and print again:")
var deckSpades = Deck.allSpades
deckSpades.shuffleArr()
count = 1
for elem in deckSpades {
    print("\(count). \(elem)")
    count += 1
}
