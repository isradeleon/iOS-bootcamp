//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    let db = Firestore.firestore()
    var messages: [Message] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavBar()
        prepareTableView()
        observeMessages()
    }
    
    private func observeMessages() {
        db.collection(K.FStore.collectionName).addSnapshotListener { snapshot, error in
            if let documents = snapshot?.documents {
                self.messages.removeAll()
                
                for doc in documents {
                    let data = doc.data()
                    guard let sender = data[K.FStore.senderField] as? String else { continue }
                    guard let body = data[K.FStore.bodyField] as? String else { continue }
                    
                    self.messages.append(
                        Message(sender: sender, body: body)
                    )
                }
                
                DispatchQueue.main.async { self.tableView.reloadData() }
            } else if error != nil {
                print(error!)
            }
        }
    }
    
    private func prepareNavBar() {
        title = K.appName
        navigationItem.hidesBackButton = true
    }
    
    private func prepareTableView() {
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: K.cellNibName, bundle: nil),
            forCellReuseIdentifier: K.cellIdentifier
        )
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let message = messageTextfield.text,
           let sender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(
                data: [
                    K.FStore.senderField: sender,
                    K.FStore.bodyField: message
                ]
            ) { (error) in
                if let error = error {
                    print(error)
                }
            }
        }
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
