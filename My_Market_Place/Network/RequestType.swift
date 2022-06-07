//
//  url.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/05/05.
//

import Foundation

enum RequestType {
    static let apiHost = "https://market-training.yagom-academy.kr/"
    
    case healthChecker
    case getProductList(pageNumber: Int, itemCountInPage: Int)
    case getProductDetail(productID: Int)
    case postProduct
    case patchProduct(productID: Int)
    case postProductVendorSecret(productID: Int)
    case deleteProduct(productID: Int, productSecretKey: Int)
    
    func url(for type: RequestType) -> String {
        switch type {
        case .healthChecker:
            return "\(RequestType.apiHost)/healthChecker"
        case .getProductList(let pageNumber, let itemCountInPage):
            return "\(RequestType.apiHost)/api/products?page_no=\(pageNumber)&items_per_page=\(itemCountInPage)"
        case .getProductDetail(let productID):
            return "\(RequestType.apiHost)/api/products/\(productID)"
        case .postProduct:
            return "\(RequestType.apiHost)/api/products"
        case .patchProduct(let productID):
            return "\(RequestType.apiHost)/api/products/\(productID)"
        case .postProductVendorSecret(let productID):
            return "\(RequestType.apiHost)/api/products/\(productID)/secret"
        case .deleteProduct(let productID, let productSecretKey):
            return "\(RequestType.apiHost)/api/products/\(productID)/\(productSecretKey)"
        }
    }
}
