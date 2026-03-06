//
//  ViewController.swift
//  Crypto Top
//
//  Created by Israel Diaz de Leon on 06/03/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstCryptoImg: UIImageView!
    @IBOutlet weak var secondCryptoImg: UIImageView!
    @IBOutlet weak var thirdCryptoImg: UIImageView!
    
    @IBOutlet weak var firstCyptoLabel: UILabel!
    @IBOutlet weak var secondCryptoLabel: UILabel!
    @IBOutlet weak var thirdCryptoLabel: UILabel!
    
    var cryptoApi: CryptoApi?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            let keys = NSDictionary(contentsOfFile: path)!
            cryptoApi = CryptoApi(
                apiKey: keys["CRYPTO_API_KEY"] as! String
            )
        }
    }

    @IBAction func cryptoDetailsPressed(_ sender: UIButton) {
        
    }
    

}

