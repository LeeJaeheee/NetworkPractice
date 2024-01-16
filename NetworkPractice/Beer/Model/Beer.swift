//
//  Beer.swift
//  NetworkPractice
//
//  Created by 이재희 on 1/16/24.
//

import Foundation

struct Beer: Codable {
    let name: String
    let image_url: String?
    let description: String
    let food_pairing: [String]
}
