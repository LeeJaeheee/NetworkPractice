//
//  BeerListCollectionViewCell.swift
//  NetworkPractice
//
//  Created by 이재희 on 1/16/24.
//

import UIKit

class BeerListCollectionViewCell: UICollectionViewCell {

    @IBOutlet var baseView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        setRadiusAndShadow(baseView)
    }
    
    func configureCell(data: Beer) {
        if let urlString = data.image_url {
            self.imageView.kf.setImage(with: URL(string: urlString))
        } else {
            self.imageView.image = UIImage(systemName: "wineglass.fill")
        }
        nameLabel.text = data.name
    }
}
