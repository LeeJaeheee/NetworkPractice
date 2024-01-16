//
//  RandomBeerViewController.swift
//  NetworkPractice
//
//  Created by 이재희 on 1/16/24.
//

import UIKit
import Kingfisher

//TODO: indicator 추가, configureUI 다시 체크, 페어링 페이지 연결

class RandomBeerViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var pairingButton: UIButton!
    @IBOutlet var refreshButton: UIButton!
    
    let manager = BeerAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        manager.callRandomBeerRequest { value in
            if let urlString = value.image_url {
                self.imageView.kf.setImage(with: URL(string: urlString))
            } else {
                self.imageView.image = UIImage(systemName: "wineglass.fill")
            }
            self.nameLabel.text = value.name
            self.descriptionLabel.text = value.description
        }
    }
    
    func configureUI() {
        imageView.tintColor = .black
        
        descriptionLabel.textAlignment = .center
        
        pairingButton.setTitle(" 푸드 페어링 추천", for: .normal)
        pairingButton.setTitleColor(.systemRed, for: .normal)
        pairingButton.tintColor = .systemRed
        
        refreshButtonTapped(refreshButton)
        refreshButton.setTitle(" 다른 맥주 추천받기", for: .normal)
        refreshButton.setTitleColor(.systemYellow, for: .normal)
        refreshButton.tintColor = .systemYellow
    }
    
}
