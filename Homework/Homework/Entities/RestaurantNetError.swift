//
//  RestaurantNetError.swift
//  Homework
//
//  Created by 조재훈 on 2023/01/08.
//

import Foundation

enum RestaurantNetError: Error {
    case invalidJSON
    case networkError
    
    var message: String {
        switch self {
        case .invalidJSON:
            return "데이터를 불러올 수 없습니다."
        case .networkError:
            return "네트워크 상태를 확인해주세요."
        }
    }
}
