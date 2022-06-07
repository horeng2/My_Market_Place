//
//  ListViewModel.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/06/07.
//

import Foundation

class ListViewModel {
    func loadData(completionHandler: @escaping (Result<ProductList, NetworkError>) -> Void) {
        let urlSessionProvider = URLSessionProvider()
        
        urlSessionProvider.getData(requestType: .getProductList(pageNumber: 1, itemCountInPage: 20)) { result in
            switch result {
            case .success(let data):
                guard let parsedData: ProductList = self.getParsedData(data: data) else {
                    return
                }
                completionHandler(.success(parsedData))
            case .failure(_):
                return completionHandler(.failure(NetworkError.emptyData))
            }
        }
    }
    
    private func getParsedData(data: Data) -> ProductList? {
        let decoder = Decoder()
        var parsedData: ProductList? = nil
        
        let result = decoder.parseListJSON(data: data)
        switch result {
        case .success(let data):
            parsedData = data
        case .failure(let error):
            print(error.localizedDescription)
        }
        return parsedData
    }
}
