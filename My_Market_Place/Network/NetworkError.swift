//
//  NetworkError.swift
//  My_Market_Place
//
//  Created by 서녕 on 2022/04/27.
//

import Foundation

enum NetworkError: Error {
    case statusCodeError
    case EmptyData
    case wrongURL
}
