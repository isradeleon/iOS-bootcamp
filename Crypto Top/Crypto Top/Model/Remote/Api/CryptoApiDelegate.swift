//
//  CoinsApiDelegate.swift
//  Crypto Top
//
//  Created by Israel Diaz de Leon on 06/03/26.
//

protocol CryptoApiDelegate {
    func onCryptoTopReady(
        firstCoin: Coin,
        secondCoin: Coin,
        thirdCoin: Coin
    )
    func onCoinDataReady(coin: Coin)
}
