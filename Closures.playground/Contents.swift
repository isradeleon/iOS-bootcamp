import Foundation

func calculator(
    n1: Int,
    n2: Int,
    operation: (Int, Int) -> Int
) -> Int {
    return operation(n1, n2)
}

func multiply(n1: Int, n2: Int) -> Int {
    return n1 * n2
}

let result = calculator(n1: 5, n2: 3, operation: multiply)
print(result)

calculator(n1: 3, n2: 4) { (n1, n2) -> Int in
    n1 + n2
}
