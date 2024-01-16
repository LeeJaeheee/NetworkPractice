//
//  BeerListViewController.swift
//  NetworkPractice
//
//  Created by 이재희 on 1/16/24.
//

import UIKit

class BeerListViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var randomButton: UIButton!
    
    let urlString = "https://api.punkapi.com/v2/beers"
    let manager = BeerAPIManager()
    var list: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureNavigation()
        configureLayout()
        configureCollectionView()
    }


}

extension BeerListViewController {
    
    func configureUI() {
        randomButton.layer.cornerRadius = randomButton.frame.height / 2
        
        manager.callRequest(urlString: urlString) { value in
            self.list = value
            self.collectionView.reloadData()
        }
    }
    
    func configureNavigation() {
        
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: BeerListCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BeerListCollectionViewCell.identifier)
    }
    
    func configureLayout() {
        let spacing:CGFloat = 24
        let width = (UIScreen.main.bounds.width - (24 * 3)) / 2
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.itemSize = CGSize(width: width, height: width * 1.2)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
    }
    
}

extension BeerListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeerListCollectionViewCell.identifier, for: indexPath) as! BeerListCollectionViewCell
        
        cell.configureCell(data: list[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: RandomBeerViewController.identifier) as! RandomBeerViewController
        vc.beer = list[indexPath.item]
        present(vc, animated: true)
    }
    
    
}
