//
//  DetailsViewController.swift
//  Crypto Top
//
//  Created by Israel Diaz de Leon on 07/03/26.
//

import UIKit

class DetailsViewController: UIViewController {

    var coinSymbol: String?
    var cryptoApi: CryptoApi?
    
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var highestLabel: UILabel!
    @IBOutlet weak var lowestLabel: UILabel!
    
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
        if let coinSymbol = coinSymbol {
            cryptoApi?.fetchCoinData(symbol: coinSymbol)
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

//MARK: - Coin Api Delegate impl
extension DetailsViewController: CryptoApiDelegate {
    func onCoinDataReady(coin: Coin) {
        DispatchQueue.main.async {
            self.symbolLabel.text = coin.name
            self.priceLabel.text = coin.currentPrice.toMoneyFormat()
            self.highestLabel.text = coin.highestPrice.toMoneyFormat()
            self.lowestLabel.text = coin.lowestPrice.toMoneyFormat()
        }
    }
}
