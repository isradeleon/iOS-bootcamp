//
//  EmergencyCallHandler.swift
//  Delegate Design Pattern
//
//  Created by Israel Diaz de Leon on 03/03/26.
//

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessTheSituation() {
        print("Assessing the situation...")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}
