import Foundation

// Calculator function receives a function called operation as a parameter
func calculator(
    n1: Int,
    n2: Int,
    operation: (Int, Int) -> Int
) -> Int {
    return operation(n1, n2)
}

// A named function that meets the requirements can be pass as such parameter
func multiply(n1: Int, n2: Int) -> Int {
    return n1 * n2
}

let result = calculator(n1: 5, n2: 3, operation: multiply)
print(result)

// We can also explicitly express all data types in a closure (anonymous function)
calculator(n1: 3, n2: 4, operation: { (n1: Int, n2: Int) -> Int in
    return n1 + n2
})

// Remove the parameter data types from the closure
calculator(n1: 3, n2: 4, operation: { (n1, n2) -> Int in
    return n1 + n2
})

// Remove return keyword & type since it's inferred from the original func defenition
calculator(n1: 3, n2: 4, operation: { (n1, n2) in n1 + n2 })

// You can also handle closure's parameters anonymously in swift
calculator(n1: 3, n2: 4, operation: { $0 + $1 })

// Finaly, since the closure is at the end, you can extract it from the func call
calculator(n1: 3, n2: 4) { $0 + $1 } // And this is called a trailing closure

// Example of a closure with the map function
let array = [1,2,3,4,5]
array.map { number in number + 1 } // The number param reprents each number to be transformed
array.map { $0 + 1 } // We can also use this parameters anonymously with the dollar sign $X syntax
