//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    
    var messages: [Message] = [
        Message(sender: "test@hey.com", body: "Hellooo"),
        Message(sender: "uyuy@hey.com", body: "Hi"),
        Message(sender: "test@hey.com", body: "What's going on")
    ]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.appName
        navigationItem.hidesBackButton = true
        prepareTableView()
    }
    
    private func prepareTableView() {
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: K.cellNibName, bundle: nil),
            forCellReuseIdentifier: K.cellIdentifier
        )
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
}

//MARK: - UITableView data source implementation
/**
 This is essentially the equivalent of RecyclerViews in Android.
 */
extension ChatViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
            return messages.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: K.cellIdentifier, for: indexPath
            ) as! MessageCell
            
            cell.messageLabel?.text = messages[indexPath.row].body
            
            return cell
    }
}

/**
 Handling row selection via tableView delegate:
 */
/*extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMessageRow = messages[indexPath.row]
    }
}*/
