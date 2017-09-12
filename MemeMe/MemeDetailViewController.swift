//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Maria  on 9/11/17.
//  Copyright © 2017 Maria . All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    var meme: Meme!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = meme.memedImage
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editMeme))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func editMeme() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nvc = storyboard.instantiateViewController(withIdentifier: "EditorNVC") as! UINavigationController
        let evc = nvc.topViewController as! EditorViewController
        evc.topText = meme.topText
        evc.bottomText = meme.bottomText
        evc.origImage = meme.originalImage
        present(nvc, animated: true) { 
            self.navigationController?.popViewController(animated: false)
        }
    }
    
    
}
