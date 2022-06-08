//
//  Vendor.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/04/26.
//

import Foundation

struct Vendor: Codable {
    let name: String
    let id: Int
    let createdAt: String
    let issuedAt: String

    private enum CodingKeys: String, CodingKey {
        case name
        case id
        case createdAt = "created_at"
        case issuedAt = "issued_at"
    }
}
