//
//  MorkURLSession.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/05/01.
//

import Foundation

struct MockData {
    let data = Data()
}

class MockURLSessionDataTask: URLSessionDataTask {
    var resumeDidCall = {}
    override func resume() {
        resumeDidCall
    }
}

class MockURLSession: URLSessionProtocol {
    var isRequestSuccess: Bool
    var sessionDataTask: MockURLSessionDataTask?

    init(isRequestSuccess: Bool = true) {
        self.isRequestSuccess = isRequestSuccess
    }

    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask {
        let sucessRespons = HTTPURLResponse(
            url: request.url!,
            statusCode: 200,
            httpVersion: "2",
            headerFields: nil
        )
        let failureRespons = HTTPURLResponse(
            url: request.url!,
            statusCode: 402,
            httpVersion: "2",
            headerFields: nil
        )
        let sessionDataTask = MockURLSessionDataTask()

        if isRequestSuccess {
            sessionDataTask.resumeDidCall = {
                completionHandler(MockData().data, sucessRespons, nil)
            }
        } else {
            sessionDataTask.resumeDidCall = {
                completionHandler(nil, failureRespons, nil)
            }
        }
        self.sessionDataTask = sessionDataTask
        return sessionDataTask
    }
}
