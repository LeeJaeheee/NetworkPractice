//
//  BeerAPIManager.swift
//  NetworkPractice
//
//  Created by 이재희 on 1/16/24.
//

import Foundation
import Alamofire

struct BeerAPIManager {
    
    func callRequest(urlString: String, completionHandler: @escaping ([Beer]) -> Void) {
        AF.request(urlString)
            .responseDecodable(of: [Beer].self) { response in
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let failure):
                    print("오류 발생")
                }
            }
    }
    
}
