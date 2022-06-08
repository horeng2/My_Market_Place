//
//  ProductListRequest.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/04/25.
//

import Foundation

struct ProductListRequest: Codable {
    let pageNumber: Int
    let rowCountInPage: Int

    private enum CodingKeys: String, CodingKey {
        case pageNumber = "page_no"
        case rowCountInPage = "items_per_page"
    }
}
