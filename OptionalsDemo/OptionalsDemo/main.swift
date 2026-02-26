//
//  main.swift
//  OptionalsDemo
//
//  Created by Israel Diaz de Leon on 26/02/26.
//

import Foundation

var myOptional: String?

myOptional = "Hello world!"

// 1. Force unwrapping
print(myOptional!)

// 2. Nil checking
if myOptional != nil {
    print(myOptional!)
}

// 3. Optional Binding
if let safeOptional = myOptional {
    // No unwrapping needed from now on:
    print(safeOptional)
}

// 4. Nil Coalescing Operator ??
myOptional = nil
print(myOptional ?? "Hello again!")

// 5.
