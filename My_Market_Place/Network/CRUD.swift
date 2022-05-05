//
//  url.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/05/05.
//

import Foundation

enum CRUD {
    static let apiHost = "https://market-training.yagom-academy.kr/"
    
    case healthChecker
    case getProductList(pageNumber: Int, itemCountInPage: Int)
    case getProductDetail(productID: Int)
    case postProduct
    case patchProduct(productID: Int)
    case postProductVendorSecret(productID: Int)
    
    func url(for type: CRUD) -> String {
        switch type {
        case .healthChecker:
            return "\(CRUD.apiHost)/healthChecker"
        case .getProductList(let pageNumber, let itemCountInPage):
            return "\(CRUD.apiHost)/api/products?page_no=\(pageNumber)&items_per_page=\(itemCountInPage)"
        case .getProductDetail(let productID):
            return "\(CRUD.apiHost)/api/products/\(productID)"
        case .postProduct:
            return "\(CRUD.apiHost)/api/products"
        case .patchProduct(let productID):
            return "\(CRUD.apiHost)/api/products/\(productID)"
        case .postProductVendorSecret(let productID):
            return "\(CRUD.apiHost)/api/products/\(productID)/secret"
        }
    }
}
