//
//  DetailsViewController.swift
//  PinterestFeed
//
//  Created by Влад Третьяк on 10/12/18.
//  Copyright © 2018 Влад Третьяк. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var bigImage: UIImageView! {
        didSet {
            guard let bigIm = viewModel?.photos else {return}
            bigImage.image = bigIm
            
            /*
 там
             viewModel.cellViewModels[indexPath.item].image
guard let image = menu?.imageName else { return }
 imageView.image = UIImage(named: image)
 //itemCell.menu = itemMenuArray[indexPath.row]
             
            здесь  let image = viewModel.cellViewModels[indexPath.item].image
             cell.imageView.image = image
             return cell
 */
            
        }
    }
    var viewModel: ViewModel?

   // @IBOutlet weak var imageView: UIImageView! {
  //      didSet {
  //          guard let image = menu?.imageName else { return }
  //          imageView.image = UIImage(named: image)
   //     }let image = viewModel.cellViewModels[indexPath.item].image
   // }
    
 //   var menu: Menu?
  //  let image = viewModel.cellViewModels[indexPath.item].image
//    cell.imageView.image = image
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}

