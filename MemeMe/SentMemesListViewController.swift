//
//  SentMemesListViewController.swift
//  MemeMe
//
//  Created by Maria  on 9/12/17.
//  Copyright © 2017 Maria . All rights reserved.
//

import UIKit

class SentMemesListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SentMemesModel.instance.count()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        
        let meme = SentMemesModel.instance.meme(atIndex: indexPath.row)
        
        cell.topLabel.text = meme.topText
        cell.bottomLabel.text = meme.bottomText
        cell.fullText.text = (meme.topText ?? "") + "..." + (meme.bottomText ?? "")
        cell.memeImageView.image = meme.originalImage

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MemeDetailView") as! MemeDetailViewController
        vc.meme = SentMemesModel.instance.meme(atIndex: indexPath.row)
        self.navigationController?.pushViewController(vc, animated: true)

    }

    
}
