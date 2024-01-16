//
//  UIView+Extension.swift
//  NetworkPractice
//
//  Created by 이재희 on 1/16/24.
//

import UIKit

extension UIView {
    
    func setRadiusAndShadow(_ baseView: UIView) {
        baseView.layer.masksToBounds = true
        baseView.layer.cornerRadius = 12
        baseView.layer.borderColor = UIColor.systemPurple.cgColor
        baseView.layer.borderWidth = 0.15
        
        layer.masksToBounds = false
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 3
        layer.shadowColor = UIColor.systemPurple.cgColor
    }
    
}
