//
//  CoinsApi.swift
//  Crypto Top
//
//  Created by Israel Diaz de Leon on 06/03/26.
//

import Foundation

struct CryptoApi {
    private let baseUrl = "https://api.freecryptoapi.com/v1/"
    private let jsonDecoder = JSONDecoder()
    
    var delegate: CoinsApiDelegate?
    let apiKey: String
    
    func fetchCryptoList() {
        let requestUrl = "\(baseUrl)getCryptoList?token=\(apiKey)"
    }
    
    func fetchCoinData(symbol: String) {
        let apiKeyUrl = "\(baseUrl)getData?token=\(apiKey)"
        let requestUrl = "\(apiKeyUrl)&symbol=\(symbol)"
    }
    
    private func performRequest(
        with urlString: String
    ) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                
                if let data = data {
                    
                }
            }
            
            task.resume()
        }
    }
    
    private func parseJSONData<T>(
        data: Data, type: T.Type
    ) -> T? where T : Decodable {
        do {
            let parsedData = try jsonDecoder.decode(
                type, from: data
            )
            return parsedData
        } catch {
            print(error)
            return nil
        }
    }
}
