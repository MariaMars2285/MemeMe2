//
//  Meme.swift
//  MemeMe
//
//  Created by Maria  on 9/8/17.
//  Copyright © 2017 Maria . All rights reserved.
//

import UIKit

struct Meme {
    
    let topText: String?
    let bottomText: String?
    let originalImage: UIImage
    let memedImage: UIImage
    
    init(topText: String?, bottomText: String?, originalImage: UIImage, memedImage: UIImage) {
        self.topText = topText?.uppercased()
        self.bottomText = bottomText?.uppercased()
        self.originalImage = originalImage
        self.memedImage = memedImage
    }
}
