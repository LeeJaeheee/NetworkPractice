//
//  RandomBeerViewController.swift
//  NetworkPractice
//
//  Created by 이재희 on 1/16/24.
//

import UIKit
import Kingfisher

//TODO: indicator 추가

class RandomBeerViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var pairingButton: UIButton!
    @IBOutlet var refreshButton: UIButton!
    
    let manager = BeerAPIManager()
    let urlString = "https://api.punkapi.com/v2/beers/random"
    
    var beer: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    @IBAction func pairingButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: beer?.food_pairing.joined(separator: "\n\n"), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "냠냠굿😋", style: .default))
        present(alert, animated: true)
    }
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        callRequest()
    }
    
}

extension RandomBeerViewController {
    
    func configureUI() {
        imageView.tintColor = .black
        
        descriptionLabel.textAlignment = .center
        
        pairingButton.setTitle(" 푸드 페어링 추천", for: .normal)
        pairingButton.setTitleColor(.systemRed, for: .normal)
        pairingButton.tintColor = .systemRed
        
        if let beer {
            titleLabel.isHidden = true
            refreshButton.isHidden = true
            setUI(value: beer)
        } else {
            callRequest()
            
            refreshButton.setTitle(" 다른 맥주 추천받기", for: .normal)
            refreshButton.setTitleColor(.systemYellow, for: .normal)
            refreshButton.tintColor = .systemYellow
        }
        
    }
    
    func callRequest() {
        manager.callRequest(urlString: urlString) { value in
            self.setUI(value: value[0])
            self.beer = value[0]
        }
    }
    
    func setUI(value: Beer) {
        if let imageUrl = value.image_url {
            self.imageView.kf.setImage(with: URL(string: imageUrl))
        } else {
            self.imageView.image = UIImage(systemName: "wineglass.fill")
        }
        self.nameLabel.text = value.name
        self.descriptionLabel.text = value.description
    }

}
