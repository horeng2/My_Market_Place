//
//  ProductPreview.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/04/25.
//

import Foundation

struct ProductPreview: Codable {
    let productId: Int
    let vendorId: Int
    let productName: String
    let thumbnail: String
    let currency: Currency
    let price: Double
    let bargainPrice: Double
    let discountedPrice: Double
    let stock: Int
    let createdDate: String
    let issuedDate: String

    private enum CodingKeys: String, CodingKey {
        case productId = "id"
        case vendorId = "vendor_id"
        case productName = "name"
        case thumbnail
        case currency
        case price
        case bargainPrice = "bargain_price"
        case discountedPrice = "discounted_price"
        case stock
        case createdDate = "created_at"
        case issuedDate = "issued_at"
    }
}
