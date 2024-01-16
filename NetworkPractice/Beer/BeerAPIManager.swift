//
//  BeerAPIManager.swift
//  NetworkPractice
//
//  Created by 이재희 on 1/16/24.
//

import Foundation
import Alamofire

struct BeerAPIManager {
    
    func callRandomBeerRequest(completionHandler: @escaping (Beer) -> Void) {
        let url = "https://api.punkapi.com/v2/beers/random"
        
        AF.request(url)
            .responseDecodable(of: [Beer].self) { response in
                switch response.result {
                case .success(let success):
                    print(success)
                    completionHandler(success[0])
                case .failure(let failure):
                    print(failure)
                }
            }
    }
    
}
