//
//  ProductParam.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/04/26.
//

import Foundation

struct ProductParam: Codable {
    let name: String
    let descriptions: String
    let price: Double
    let currency: Currency
    let discountedPrice: Double
    let stock: Int
    let secret: String

    private enum CodingKeys: String, CodingKey {
        case name
        case descriptions
        case price
        case currency
        case discountedPrice = "discounted_price"
        case stock
        case secret
    }
}
