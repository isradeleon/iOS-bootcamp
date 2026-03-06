//
//  ApiRequest.swift
//  Crypto Top
//
//  Created by Israel Diaz de Leon on 06/03/26.
//

import Foundation

struct ApiRequestClient {
    private let jsonDecoder = JSONDecoder()
    
    func performRequest<T>(
        with urlString: String,
        responseType: T.Type,
        onSuccess: @escaping (T) -> Void,
        onFailure: @escaping (Error) -> Void
    ) where T: Decodable {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    onFailure(error)
                    return
                }
                
                if let data = data {
                    if let parsedData = self.parseJSONData(
                        data: data, type: responseType
                    ) {
                        onSuccess(parsedData)
                    }
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
