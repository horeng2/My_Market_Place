//
//  RegistProductRequest.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/04/26.
//

import Foundation

struct RegistProductRequest: Codable {
    let vendorId: String
    let productParam: ProductParam
    let images: [RegistImage]

    private enum CodingKeys: String, CodingKey {
        case vendorId = "identifier"
        case productParam = "params"
        case images
    }
}
