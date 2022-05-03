//
//  URLSessionProvider.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/04/27.
//

import Foundation

class URLSessionProvider {
    let session: URLSessionProtocol
    let apiHost =  "https://market-training.yagom-academy.kr/"

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func dataTask(
        request: URLRequest,
        completionHandler: @escaping (Result<Data, NetworkError>) -> Void
    ) {
        let task = session.dataTask(with: request) { data, urlRespons, _ in
            guard let httpRespone = urlRespons as? HTTPURLResponse,
                  (200...299).contains(httpRespone.statusCode) else {
                      return completionHandler(.failure(.statusCodeError))
                  }
            guard let data = data else {
                return completionHandler(.failure(.EmptyData))
            }
            completionHandler(.success(data))
        }
        task.resume()
    }

    func getProductListData(
        requestType: ProductListRequest,
        completionHandler: @escaping (Result<Data, NetworkError>) -> Void
    ) {
        guard let url = URL(string: apiHost) else {
            return completionHandler(.failure(NetworkError.wrongURL))
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        dataTask(request: request, completionHandler: completionHandler)
    }
}
