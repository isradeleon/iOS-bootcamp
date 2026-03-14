//
//  StringExt.swift
//  Flash Chat iOS13
//
//  Created by Israel Diaz de Leon on 14/03/26.
//  Copyright © 2026 Angela Yu. All rights reserved.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex)
            .evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        !self.isEmpty && self.count >= 5
    }
}
