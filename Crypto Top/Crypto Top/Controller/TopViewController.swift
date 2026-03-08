//
//  ViewController.swift
//  Crypto Top
//
//  Created by Israel Diaz de Leon on 06/03/26.
//

import UIKit

class TopViewController: UIViewController {

    @IBOutlet weak var firstCryptoLabel: UILabel!
    @IBOutlet weak var secondCryptoLabel: UILabel!
    @IBOutlet weak var thirdCryptoLabel: UILabel!
    
    var cryptoApi: CryptoApi?
    var lastPressedSymbol: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = Bundle.main.path(forResource: "apikeys", ofType: "plist") {
            let keys = NSDictionary(contentsOfFile: path)!
            setupCryptoApi(
                key: keys["CRYPTO_API_KEY"] as! String
            )
        }
    }
    
    func setupCryptoApi(key: String) {
        cryptoApi = CryptoApi(apiKey: key)
        cryptoApi?.delegate = self
        cryptoApi?.fetchCryptoList()
    }

    @IBAction func cryptoDetailsPressed(_ sender: UIButton) {
        lastPressedSymbol = switch sender.accessibilityIdentifier {
            case "firstCoinBtn": firstCryptoLabel.text
            case "secondCoinBtn": secondCryptoLabel.text
            case "thirdCoinBtn": thirdCryptoLabel.text
            default: "BTC"
        }
        performSegue(withIdentifier: "toCoinDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCoinDetails" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.coinSymbol = lastPressedSymbol ?? "BTC"
        }
    }
}

extension TopViewController: CryptoApiDelegate {
    func onCryptoTopReady(
        firstCoin: Coin, secondCoin: Coin, thirdCoin: Coin
    ) {
        DispatchQueue.main.async {
            self.firstCryptoLabel.text = firstCoin.name
            self.secondCryptoLabel.text = secondCoin.name
            self.thirdCryptoLabel.text = thirdCoin.name
        }
    }
}
