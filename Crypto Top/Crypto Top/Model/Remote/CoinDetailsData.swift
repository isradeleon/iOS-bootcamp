//
//  CoinDetailsData.swift
//  Crypto Top
//
//  Created by Israel Diaz de Leon on 06/03/26.
//

struct CoinDetailsData: Decodable {
    let symbol: String?
    let last: Float?
    let lowest: Float?
    let highest: Float?
}
