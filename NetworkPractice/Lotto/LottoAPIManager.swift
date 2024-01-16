//
//  LottoAPIManager.swift
//  NetworkPractice
//
//  Created by 이재희 on 1/16/24.
//

import Foundation
import Alamofire

struct LottoAPIManager {
    
    func callRequest(number: String, completionHandler: @escaping ([Int]) -> Void) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        
        AF.request(url)
            .responseDecodable(of: Lotto.self) { response in
                switch response.result {
                case .success(let success):
                    completionHandler(success.list)
                case .failure(let failure):
                    print(failure)
                }
            }
    }
    
}
