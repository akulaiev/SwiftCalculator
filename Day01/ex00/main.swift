
let colors: [Color] = Color.allColors
let values: [Value] = Value.allValues

print("Colors are:")
for col in colors {
    print("\t\(col)")
}
print("Values are:")
for val in values {
    print("\t\(val) = \(val.rawValue)")
}
