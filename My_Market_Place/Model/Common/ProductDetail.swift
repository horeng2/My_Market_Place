//
//  ProductDetail.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/04/26.
//

import Foundation

struct ProductDetail: Codable {
    let productId: Int
    let vendorId: Int
    let vendorName: String
    let description: String
    let thumbnailUrl: String
    let currency: Currency
    let price: Double
    let bargainPrice: Double
    let discountedPrice: Double
    let stock: Int
    let images: [Image]
    let vendorInfo: Vendor
    let createdAt: String
    let issuedAt: String

    private enum CodingKeys: String, CodingKey {
        case productId = "id"
        case vendorId = "vendor_id"
        case vendorName = "name"
        case description
        case thumbnailUrl = "thumbnail"
        case currency
        case price
        case bargainPrice = "bargain_price"
        case discountedPrice = "discounted_price"
        case stock
        case images
        case vendorInfo = "vendors"
        case createdAt = "created_at"
        case issuedAt = "issued_at"
    }
}
