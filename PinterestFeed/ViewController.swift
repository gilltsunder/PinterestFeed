//
//  ViewController.swift
//  PinterestFeed
//
//  Created by Влад Третьяк on 10/7/18.
//  Copyright © 2018 Влад Третьяк. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!
    
    //MARK: properties
    let viewModel = ViewModel(client: UnsplashClient())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        //Init viewModel
        viewModel.showLoading = {
            if self.viewModel.isLoading {
                self.activityIndecator.startAnimating()
                self.collectionView.alpha = 0.0
            } else {
                self.activityIndecator.stopAnimating()
                self.collectionView.alpha = 1.0
                
            }
        }
        viewModel.showError = {  error in
            print(error)
        }
        viewModel.reloadData = {
            self.collectionView.reloadData()
        }
        viewModel.fetchPhotos()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showIMG" {
            if let vc = segue.destination as? DetailViewController {
                let vM = sender as? ViewModel
                print(vM ?? "nill")
                vc.viewModel = vM
            }
        }
    }
}

//MARK: Flow layuot delegate

extension ViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let image = viewModel.cellViewModels[indexPath.item].image
        let height = image.size.height
        
        return height
    }
}

//MARK: Data sourse

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let image = viewModel.cellViewModels[indexPath.item].image
        cell.imageView.image = image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = viewModel.cellViewModels[indexPath.row].image
        self.performSegue(withIdentifier: "showIMG", sender: menu)
    }

}


