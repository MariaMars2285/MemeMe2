//
//  SentMemesViewController.swift
//  MemeMe
//
//  Created by Maria  on 9/8/17.
//  Copyright © 2017 Maria . All rights reserved.
//

import UIKit

class SentMemesViewController: UIViewController {
    
    fileprivate let itemsPerRow: CGFloat = 3
    
    fileprivate let itemSpacing: CGFloat = 2

    
    let data: [Meme] = [
        Meme(topText: "Maria", bottomText: "Selvam", originalImage: UIImage(named: "LaunchImage")!, memedImage: UIImage(named: "Grid")!),
        Meme(topText: "hello", bottomText: "hi", originalImage: UIImage(named: "LaunchImage")!, memedImage: UIImage(named: "Grid")!),
        Meme(topText: "test", bottomText: "tool", originalImage: UIImage(named: "Grid")!, memedImage: UIImage(named: "Grid")!),
        Meme(topText: "test", bottomText: "three", originalImage: UIImage(named: "LaunchImage")!, memedImage: UIImage(named: "Grid")!),
        Meme(topText: "you", bottomText: "helo", originalImage: UIImage(named: "Grid")!, memedImage: UIImage(named: "Grid")!)]

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.performSegue(withIdentifier: "showEditor", sender: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SentMemesViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCell
        let meme = data[indexPath.item]
        cell.topLabel.text = meme.topText
        cell.imageView.image = meme.originalImage
        return cell
    }
}

extension SentMemesViewController: UICollectionViewDelegate {
    
}

extension SentMemesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let totalWidth = self.view.bounds.size.width - 2 * itemSpacing
        let itemWidth = totalWidth / itemsPerRow
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
}
