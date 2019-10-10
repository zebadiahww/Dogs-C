//
//  ZWWImageCollectionViewController.swift
//  DogsC
//
//  Created by Zebadiah Watson on 10/10/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

private let reuseIdentifier = "imageCell"



class ZWWImageCollectionViewController: UICollectionViewController {
    
    
    //receiver for breed and subbreed from SubBreed controller
    var breed: ZWWBreed?
    
    var subbreed: ZWWSubBreeds?
    //local SOT
    var imageURLS: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLS.count
//        if subbreed != nil {
//            guard let subbreed = subbreed else { return 0 }
//            return subbreed.imageURLs.count
//        } else {
//            guard let breed = breed else {return 0}
//            return breed.imageURLs.count
//        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        
        return cell
    }
    
    func fetchImageURLS() {
        if subbreed != nil {
            guard let subbreed = subbreed, let breed = breed else {return}
            ZWWBreedController.shared().fetchSubBreedImageUrl(subbreed, breed: breed) { (imageURLs) in
                DispatchQueue.main.async {
                    self.imageURLS = imageURLs
                    self.collectionView.reloadData()
                }
                
            }
        } else {
            guard let breed = breed else { return }
            ZWWBreedController.shared().fetchBreedImageUrl(breed) { (imageURLs) in
                DispatchQueue.main.async {
                    self.imageURLS = imageURLs
                    self.collectionView.reloadData()
                }
            }
        }
    }
}
