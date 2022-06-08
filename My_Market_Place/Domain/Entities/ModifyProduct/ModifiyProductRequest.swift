//
//  ModifiyRequest.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/04/26.
//

import Foundation

struct ModifiyProductRequest: Codable {
    let vendorId: Int
    let productId: Int
    let productName: String
    let description: String
    let thumbnailId: Int
    let price: Double
    let currency: Currency
    let discountedPrice: Double
    let stock: Int
    let vendorPassword: String

    private enum CodingKeys: String, CodingKey {
        case vendorId = "vendor_id"
        case productId = "id"
        case productName = "name"
        case description
        case thumbnailId = "thumbnail_id"
        case price
        case currency
        case discountedPrice = "discounted_price"
        case stock
        case vendorPassword = "secret"
    }
}
