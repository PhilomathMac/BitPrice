//
//  PriceManager.swift
//  BitPrice
//
//  Created by McKenzie Macdonald on 8/10/22.
//

import Foundation

struct PriceManager {
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
                    print(error!.localizedDescription)
                    return
                }
                
                if let safeData = data {
                    
                    if let coinData = self.parseJSON(safeData) {
                        
                        print("JSON parsed successfully")
                        print(coinData.rate)
                    }
                    
                }
            }
            
            task.resume()
        }
        
    }
    
    func parseJSON(_ coinData: Data) -> BitCoinPrice? {
        
        let decoder = JSONDecoder()
        
        do {
            
            let decodedData = try decoder.decode(BitCoinPrice.self, from: coinData)
            
            let time = decodedData.time
            let rate = decodedData.rate
            let fromUnit = decodedData.asset_id_base
            let toUnit = decodedData.asset_id_quote
            
            return BitCoinPrice(time: time, asset_id_base: fromUnit, asset_id_quote: toUnit, rate: rate)
            
        }
        catch {
            print("Error parsing JSON")
            return nil
        }
        
    }

}
