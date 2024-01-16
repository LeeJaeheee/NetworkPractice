//
//  UIViewController+Extension.swift
//  NetworkPractice
//
//  Created by 이재희 on 1/16/24.
//

import UIKit

extension UIViewController: ReusableProtocol {
    static var identifier: String {
        String(describing: self)
    }
}
