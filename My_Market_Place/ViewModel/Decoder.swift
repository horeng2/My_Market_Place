//
//  parsing.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/06/07.
//

import Foundation

class Decoder {
    let decoder = JSONDecoder()
    
    func parsePageJSON(data: Data, type: RequestType.GetDataType) -> Result<ProductList?, NetworkError> {
        let pageJSON: Data = data
        guard let decodedPageJSON = try? decoder.decode(ProductList.self, from: pageJSON) else {
            return .failure(.parsingFailed)
        }
        return .success(decodedPageJSON)
    }
}
