//
//  VendorSecretKey.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/04/27.
//

import Foundation

struct VendorSecretKey: Codable {
    let productId: Int
    let vendorId: String
    let vendorPassword: String

    private enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case vendorId = "identifier"
        case vendorPassword = "secret"
    }
}
