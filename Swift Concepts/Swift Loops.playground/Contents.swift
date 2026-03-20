import Foundation

/**
 FOR loops:
 */
// Arrays
let fruits = ["Apple", "Pear", "Orange"]
for fruit in fruits { print(fruit) }

print("---------------")

// Sets don't guarantee the order, but are considered more efficient:
let fruitsSet: Set = ["Apple", "Pear", "Orange"]
for fruit in fruitsSet { print(fruit) }

print("---------------")

// Looping through a map
let contacts = ["Adam": 1232434332, "Amy": 6787875767]
for contact in contacts { print("\(contact.key) - \(contact.value)") }
for (contact, number) in contacts { print("\(contact) - \(number)") }

print("---------------")

// Looping through text
let text = "There was a time..."
for letter in text { print(letter) }

print("---------------")

// Looping through a range
let halfOpenRange = 1..<5
for n in halfOpenRange { print(n) }

print("---------------")

// For loop without anonymous constant
for _ in 1...5 { print("I'll be printed 5 times!") }

print("---------------")

/**
 WHILE loops:
 */
var now = Date().timeIntervalSince1970
let oneSecondPassed = now + 1

while now < oneSecondPassed {
    print("I'm running...")
    now = Date().timeIntervalSince1970
}
