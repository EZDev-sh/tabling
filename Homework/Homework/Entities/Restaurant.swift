//
//  Restaurant.swift
//  Homework
//
//  Created by 조재훈 on 2023/01/08.
//

import Foundation

struct Restaurants: Decodable {
    let list: [Restaurant]
}

struct Restaurant: Decodable {
    let restaurantIdx: Int
    let thumbnail: String
    let classification: String
    let restaurantName: String
    let rating: Double
    let reviewCount: Int
    let summaryAddress: String
    let isQuickBooking: Bool
    let isRemoteWaiting: Bool
    let useWaiting: Bool
    let useBooking: Bool
    let isNew: Bool
    let waitingCount: Int
    
    func getGrade() -> String {
        if reviewCount > 300 {
            return String(format: "%.1f (300+)", rating)
        }
        else {
            return String(format: "%.1f (%d)", rating, reviewCount)
        }
    }
    
    func getWatingTeam() -> String {
        if waitingCount <= 0 {
            return "대기 없음"
        }
        else {
            return "대기 \(waitingCount)팀"
        }
    }
}
