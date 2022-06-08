//
//  ProductList.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/04/25.
//

import Foundation

struct ProductList: Codable {
    let pageNumber: Int
    let rowCountInPage: Int
    let totalRowCount: Int
    let firstIndex: Int
    let lastIndex: Int
    let lastPage: Int
    let hasNextPage: Bool
    let hasPreviousPage: Bool
    let productsInPage: [ProductPreview]

    private enum CodingKeys: String, CodingKey {
        case pageNumber = "page_no"
        case rowCountInPage = "items_per_page"
        case totalRowCount = "total_count"
        case firstIndex = "offset"
        case lastIndex = "limit"
        case lastPage = "last_page"
        case hasNextPage = "has_next"
        case hasPreviousPage = "has_prev"
        case productsInPage = "pages"
    }
}
