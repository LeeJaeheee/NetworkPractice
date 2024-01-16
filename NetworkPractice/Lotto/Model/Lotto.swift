//
//  Lotto.swift
//  NetworkPractice
//
//  Created by 이재희 on 1/16/24.
//

import Foundation

struct Lotto: Codable {
    let drwNo: Int
    let drwNoDate: String
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    
    var list: [Int] {
        [drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6, bnusNo]
    }
}
