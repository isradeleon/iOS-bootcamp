//
//  Airplane.swift
//  Protocols Demo
//
//  Created by Israel Diaz de Leon on 02/03/26.
//

/**
 Structs cannot inherit, but they can implement protocols instead.
 */
struct Airplane: CanFly {
    func fly() {
        print("The airplane lifts off into the air.")
    }
}
