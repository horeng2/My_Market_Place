//
//  URLSessionProvider.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/04/27.
//

import Foundation

class URLSessionProvider {
    let session: URLSessionProtocol
    let apiHost = "https://market-training.yagom-academy.kr/"

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

    func getData(
        requestType: RequestType,
        completionHandler: @escaping (Result<Data, NetworkError>) -> Void
    ) {
        guard let url = URL(string: requestType.url()) else {
            return completionHandler(.failure(NetworkError.wrongURL))
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        dataTask(request: request, completionHandler: completionHandler)
    }

    func postData(
        parameters: ProductParam,
        registImages: [Data],
        completionHandler: @escaping (Result<Data, NetworkError>) -> Void
    ) {
        let boundary = "\(UUID().uuidString)"
        guard let url = URL(string: RequestType.postProduct.url()) else {
            return completionHandler(.failure(NetworkError.wrongURL))
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.addValue("f4363f92-71e8-11ec-abfa-17aac326b73f", forHTTPHeaderField: "identifier")
//        request.httpBody = createBody(parameters: parameters, boundary: boundary, images: registImages)

        dataTask(request: request, completionHandler: completionHandler)
    }

//    func createBody(parameters: ProductParam, boundary: String, images: [Data]) -> Data {
//
//    }
}
