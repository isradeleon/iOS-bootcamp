//
//  Surgeon.swift
//  Delegate Design Pattern
//
//  Created by Israel Diaz de Leon on 03/03/26.
//

// Through inheritance, the Surgeon class inherits the Doctor protocol impl
class Surgeon: Doctor {
    override func performCPR() {
        print("Performs CPR & uses Defibrillator on the patient.")
    }
}
