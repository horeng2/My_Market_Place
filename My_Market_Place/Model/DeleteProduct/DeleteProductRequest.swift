//
//  DeleteProductRequest.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/04/27.
//

import Foundation

struct DeleteProductRequest: Codable {
    let vendorId: String
    let productId: Int
    let productSecretKey: String

    private enum CodingKeys: String, CodingKey {
        case vendorId = "identifier"
        case productId = "product_id"
        case productSecretKey = "product_secret"
    }
}
