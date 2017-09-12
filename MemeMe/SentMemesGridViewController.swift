//
//  SentMemesGridViewController.swift
//  MemeMe
//
//  Created by Maria  on 9/8/17.
//  Copyright © 2017 Maria . All rights reserved.
//

import UIKit

class SentMemesGridViewController: UIViewController {
    
    fileprivate let itemsPerRow: CGFloat = 3
    
    fileprivate let itemSpacing: CGFloat = 1
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if SentMemesModel.instance.count() == 0 {
            self.performSegue(withIdentifier: "showEditor", sender: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension SentMemesGridViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SentMemesModel.instance.count()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCell
        let meme = SentMemesModel.instance.meme(atIndex: indexPath.item)
        cell.setupCellWith(meme: meme)
        return cell
        
    }
}

extension SentMemesGridViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MemeDetailView") as! MemeDetailViewController
        vc.meme = SentMemesModel.instance.meme(atIndex: indexPath.item)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SentMemesGridViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let totalWidth = self.view.bounds.size.width - 2 * itemSpacing
        let itemWidth = totalWidth / itemsPerRow
        return CGSize(width: itemWidth, height: itemWidth)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
    
}




