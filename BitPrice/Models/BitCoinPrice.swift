//
//  BitCoinPrice.swift
//  BitPrice
//
//  Created by McKenzie Macdonald on 8/10/22.
//

import Foundation

struct BitCoinPrice: Codable {
    let time: String
    let assetIdBase: String
    let assetIdQuote: String
    let rate: Double
    
//    enum CodingKeys: String, CodingKeys {
//        case time = time
//        case unitFrom = "asset_id_base"
//        case unitTo = "asset_id_quote"
//        case rate = rate
//    }
}
