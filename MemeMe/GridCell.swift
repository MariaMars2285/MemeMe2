//
//  GridCell.swift
//  MemeMe
//
//  Created by Maria  on 9/8/17.
//  Copyright © 2017 Maria . All rights reserved.
//

import UIKit

class GridCell: UICollectionViewCell {
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var bottomLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setupCellWith(meme: Meme) {
        topLabel.text = meme.topText
        bottomLabel.text = meme.bottomText
        imageView.image = meme.originalImage
        
    }
}
