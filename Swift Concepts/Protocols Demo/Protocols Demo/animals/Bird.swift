//
//  Bird.swift
//  Protocols Demo
//
//  Created by Israel Diaz de Leon on 02/03/26.
//

class Bird {
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("The female bird lays an egg.")
        } else {
            print("Male birds do not lay eggs!")
        }
    }
}
