//
//  Image.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/04/26.
//

import Foundation

struct Image {
    let imageId: Int
    let url: String
    let thumbnailUrl: String
    let succeed: Bool
    let issuedAt: String

    private enum CodingKeys: String, CodingKey {
        case imageId = "id"
        case url
        case thumbnailURL = "thumbnail_url"
        case succeed
        case issuedAt = "issued_at"
    }
}
