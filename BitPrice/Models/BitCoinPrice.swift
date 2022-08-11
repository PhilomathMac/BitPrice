//
//  BitCoinPrice.swift
//  BitPrice
//
//  Created by McKenzie Macdonald on 8/10/22.
//

import Foundation

struct BitCoinPrice: Decodable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
