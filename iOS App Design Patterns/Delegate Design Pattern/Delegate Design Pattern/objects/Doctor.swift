//
//  Doctor.swift
//  Delegate Design Pattern
//
//  Created by Israel Diaz de Leon on 03/03/26.
//

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor performs CPR on the patient.")
    }
}
