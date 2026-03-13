//
//  Paramedic.swift
//  Delegate Design Pattern
//
//  Created by Israel Diaz de Leon on 03/03/26.
//

struct Paramedic: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic performs CPR on the patient.")
    }
}
