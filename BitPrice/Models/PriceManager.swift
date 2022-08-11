//
//  PriceManager.swift
//  BitPrice
//
//  Created by McKenzie Macdonald on 8/10/22.
//

import Foundation

protocol PriceManagerDelegate {
    func didUpdatePrice(_ priceManager: PriceManager, coinData: BitCoinPrice)
    
    func didFailWithError(_ error: Error)
}

struct PriceManager {
    
    var delegate: PriceManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)\(currency)?apiKey=\(Constants.apiKey)"
        
        performRequest(with: urlString)
    }
    
    func performRequest(with url: String) {
        
        if let url = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    
                    if let coinData = self.parseJSON(safeData) {
                        
                        delegate?.didUpdatePrice(self, coinData: coinData)
                    }
                    
                }
            }
            
            task.resume()
        }
        
    }
    
    func parseJSON(_ coinData: Data) -> BitCoinPrice? {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            
            let decodedData = try decoder.decode(BitCoinPrice.self, from: coinData)
            
            let time = decodedData.time
            let rate = decodedData.rate
            let fromUnit = decodedData.assetIdBase
            let toUnit = decodedData.assetIdQuote
            
            return BitCoinPrice(time: time, assetIdBase: fromUnit, assetIdQuote: toUnit, rate: rate)
            
        }
        catch {
            delegate?.didFailWithError(error)
            return nil
        }
        
    }

}
