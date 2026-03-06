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
    
    var delegate: CoinsApiDelegate?
    
    func fetchCryptoList() {
        let requestUrl = "\(baseUrl)getCryptoList?token=\(apiKey)"
        
        client.performRequest(
            with: requestUrl,
            responseType: CryptoListData.self,
            onSuccess: { cryptoListData in
                
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
                
            },
            onFailure: { print($0) })
    }
}
