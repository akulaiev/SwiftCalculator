print("Let's print allSpades from the Deck!")
var count: Int = 1
for elem in Deck.allSpades {
    print("\(count). \(elem)")
    count += 1
}
print("\n")
print("Now it's time for the Clubs")
count = 1
for elem in Deck.allClubs {
    print("\(count). \(elem)")
    count += 1
}
print("\n")
print("We're halfway through - looking at Hearts")
count = 1
for elem in Deck.allHearts {
    print("\(count). \(elem)")
    count += 1
}
print("\n")
print("The last color in our deck: Diamonds")
count = 1
for elem in Deck.allDiamonds {
    print("\(count). \(elem)")
    count += 1
}
