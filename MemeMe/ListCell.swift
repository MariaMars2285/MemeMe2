//
//  ListCell.swift
//  MemeMe
//
//  Created by Maria  on 9/11/17.
//  Copyright © 2017 Maria . All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var bottomLabel: UILabel!
    
    @IBOutlet weak var fullText: UILabel!
    
    @IBOutlet weak var memeImageView: UIImageView!
    
    func setupCellWith(meme: Meme) {
        topLabel.text = meme.topText
        bottomLabel.text = meme.bottomText
        fullText.text = (meme.topText ?? "") + "..." + (meme.bottomText ?? "")
        memeImageView.image = meme.originalImage

    }

}
