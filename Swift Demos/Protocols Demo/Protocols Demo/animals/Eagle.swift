//
//  Eagle.swift
//  Protocols Demo
//
//  Created by Israel Diaz de Leon on 02/03/26.
//

class Eagle: Bird, CanFly {
    func fly() {
        print("The eagle flaps its wings and lifts off into the air.")
    }
    
    func hunt() {
        print("Since I'm an eagle, let's got hunting!")
    }
}
