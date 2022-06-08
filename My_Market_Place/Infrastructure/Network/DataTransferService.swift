//
//  parsing.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/06/07.
//

import Foundation

class Decoder {
    let decoder = JSONDecoder()

    func parseListJSON(data: Data) -> Result<ProductList, NetworkError> {
        let pageJSON: Data = data
        guard let decodedPageJSON = try? decoder.decode(ProductList.self, from: pageJSON) else {
            return .failure(.parsingFailed)
        }
        return .success(decodedPageJSON)
    }

    func parseDetailJSON(data: Data) -> Result<ProductDetail, NetworkError> {
        let pageJSON: Data = data
        guard let decodedPageJSON = try? decoder.decode(ProductDetail.self, from: pageJSON) else {
            return .failure(.parsingFailed)
        }
        return .success(decodedPageJSON)
    }
}
