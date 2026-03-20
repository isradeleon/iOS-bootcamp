//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Israel Diaz de Leon on 14/03/26.
//  Copyright © 2026 Angela Yu. All rights reserved.
//

/**
 It seems to be convention in Swift to name the "Constants" class / struct simply "K":
 */

struct K {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    static let userSegue = "LoadingToChat"
    static let noUsersegue = "LoadingToLogin"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
