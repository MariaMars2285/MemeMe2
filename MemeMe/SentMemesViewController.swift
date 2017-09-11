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
    
    fileprivate let itemSpacing: CGFloat = 1
    
    @IBOutlet weak var tabBar: UITabBar!
    
    @IBOutlet weak var collectionView: UICollectionView!

    enum SentMemesViewControllerType {
        
        case list
        case grid
    }
    
    fileprivate var vcType = SentMemesViewControllerType.list
    
    var data: [Meme] = [
        Meme(topText: "Maria", bottomText: "Selvam", originalImage: UIImage(named: "LaunchImage")!, memedImage: UIImage(named: "LaunchImage")!),
        Meme(topText: "hello", bottomText: "hi", originalImage: UIImage(named: "LaunchImage")!, memedImage: UIImage(named: "LaunchImage")!),
        Meme(topText: "test", bottomText: "tool", originalImage: UIImage(named: "Grid")!, memedImage: UIImage(named: "Grid")!),
        Meme(topText: "test", bottomText: "three", originalImage: UIImage(named: "LaunchImage")!, memedImage: UIImage(named: "LaunchImage")!),
        Meme(topText: "you", bottomText: "helo", originalImage: UIImage(named: "Grid")!, memedImage: UIImage(named: "Grid")!)]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.selectedItem = self.tabBar.items?.first
        //self.performSegue(withIdentifier: "showEditor", sender: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditor" {
            let nvc = segue.destination as! UINavigationController
            let vc = nvc.viewControllers.first as! EditorViewController
            vc.delegate = self
        }
    }
    
}

extension SentMemesViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if self.vcType == .grid {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCell
            let meme = data[indexPath.item]
            cell.topLabel.text = meme.topText
            cell.bottomLabel.text = meme.bottomText
            cell.imageView.image = meme.originalImage
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as! ListCell
            let meme = data[indexPath.item]
            cell.topLabel.text = meme.topText
            cell.bottomLabel.text = meme.bottomText
            cell.fullText.text = (meme.topText ?? "") + "..." + (meme.bottomText ?? "")
            cell.imageView.image = meme.originalImage
            return cell

        }
    }
}

extension SentMemesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MemeDetailView") as! MemeDetailViewController
        vc.meme = data[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SentMemesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if self.vcType == .grid {
            let totalWidth = self.view.bounds.size.width - 2 * itemSpacing
            print(totalWidth)
            let itemWidth = totalWidth / itemsPerRow
            print(itemWidth)
            return CGSize(width: itemWidth, height: itemWidth)
        } else {
            return CGSize(width: self.view.bounds.width, height: 150)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
    
}

extension  SentMemesViewController: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            self.vcType = .list
        } else if item.tag == 1 {
            self.vcType = .grid
        }
        
        self.collectionView.reloadData()
    }
}

extension SentMemesViewController: EditorViewControllerDelegate {
    
    func savedMeme(meme: Meme) {
        data.append(meme)
        self.collectionView.reloadData()
    }
}



