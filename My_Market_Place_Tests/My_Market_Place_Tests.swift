//
//  My_Market_Place_Tests.swift
//  My_Market_Place_Tests
//
//  Created by 서녕 on 2022/04/18.
//

import XCTest
@testable import My_Market_Place

class My_Market_Place_Tests: XCTestCase {
    let mockSession = MockURLSession()
    var sut: URLSessionProvider!

    override func setUpWithError() throws {
        self.sut = .init(session: mockSession)
    }

    func test_getData_success() {
        let response = try? JSONDecoder().decode(
            ProductList.self,
            from: MockData().data
        )

        sut.getProductListData(
            requestType: ProductListRequest(pageNumber: 1, rowCountInPage: 1)
        ) { result in
            switch result {
            case .success(let data):
                guard let list = try? JSONDecoder().decode(ProductList.self, from: data) else {
                    XCTFail("decode error")
                    return
                }
                XCTAssertEqual(list.pageNumber, response?.pageNumber)
            case .failure:
                XCTFail("getData failure")
            }
        }
    }

    func test_getData_failure() {
        sut = URLSessionProvider(session: MockURLSession(isRequestSuccess: false))

        sut.getProductListData(
            requestType: ProductListRequest(pageNumber: 1, rowCountInPage: 1)
        ) { result in
            switch result {
            case .success:
                XCTFail("result is success")
            case .failure(let error):
                XCTAssertEqual(error, NetworkError.statusCodeError)
            }
        }
    }
}