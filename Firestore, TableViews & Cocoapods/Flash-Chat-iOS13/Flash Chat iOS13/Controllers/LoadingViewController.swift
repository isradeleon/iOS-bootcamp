//
//  LoadingViewController.swift
//  Flash Chat iOS13
//
//  Created by Israel Diaz de Leon on 20/03/26.
//  Copyright © 2026 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoadingViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        checkFirebaseAuth()
    }
    
    func checkFirebaseAuth() {
        let firebaseAuth = Auth.auth()
        if firebaseAuth.currentUser != nil {
            performSegue(withIdentifier: K.userSegue, sender: self)
        } else {
            performSegue(withIdentifier: K.noUsersegue, sender: self)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
