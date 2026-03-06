//
//  CoinsApi.swift
//  Crypto Top
//
//  Created by Israel Diaz de Leon on 06/03/26.
//

import Foundation

struct CryptoApi {
    private let baseUrl = "https://api.freecryptoapi.com/v1/"
    private let client = ApiRequestClient()
    
    let apiKey: String
    var delegate: CryptoApiDelegate?
    
    func fetchCryptoList() {
        let requestUrl = "\(baseUrl)getCryptoList?token=\(apiKey)"
        
        client.performRequest(
            with: requestUrl,
            responseType: CryptoListData.self,
            onSuccess: { cryptoListData in
                if let result = cryptoListData.result {
                    delegate?.onCryptoTopReady(
                        firstCoin: Coin(
                            name: result[0].symbol ?? ""
                        ),
                        secondCoin: Coin(
                            name: result[1].symbol ?? ""
                        ),
                        thirdCoin: Coin(
                            name: result[2].symbol ?? ""
                        )
                    )
                }
            },
            onFailure: { print($0) })
    }
    
    func fetchCoinData(symbol: String) {
        let apiKeyUrl = "\(baseUrl)getData?token=\(apiKey)"
        let requestUrl = "\(apiKeyUrl)&symbol=\(symbol)"
        
        client.performRequest(
            with: requestUrl,
            responseType: CoinDetailsData.self,
            onSuccess: { coinDetails in
                delegate?.onCoinDataReady(
                    coin: Coin(
                        name: coinDetails.symbol ?? "",
                        currentPrice: coinDetails.last ?? 0.0,
                        lowestPrice: coinDetails.last ?? 0.0,
                        highestPrice: coinDetails.last ?? 0.0
                    )
                )
            },
            onFailure: { print($0) })
    }
}
