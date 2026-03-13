//
//  Coin.swift
//  Crypto Top
//
//  Created by Israel Diaz de Leon on 06/03/26.
//

struct Coin {
    let name: String
    let currentPrice: Float
    let lowestPrice: Float
    let highestPrice: Float
    
    init(
        name: String,
        currentPrice: Float = 0.0,
        lowestPrice: Float = 0.0,
        highestPrice: Float = 0.0
    ) {
        self.name = name
        self.currentPrice = currentPrice
        self.lowestPrice = lowestPrice
        self.highestPrice = highestPrice
    }
}

extension Float {
    func toMoneyFormat(currency: String = "USD") -> String {
        let formattedValue = String(format: "$ %.1f", self)
        return "\(formattedValue) \(currency)"
    }
}
