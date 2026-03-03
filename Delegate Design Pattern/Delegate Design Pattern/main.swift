//
//  main.swift
//  Delegate Design Pattern
//
//  Created by Israel Diaz de Leon on 03/03/26.
//

let emergencyCallHandler = EmergencyCallHandler()

let surgeon = Surgeon(handler: emergencyCallHandler)

emergencyCallHandler.assessTheSituation()
emergencyCallHandler.medicalEmergency()
