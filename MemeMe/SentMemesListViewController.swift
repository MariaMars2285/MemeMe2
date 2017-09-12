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
        if SentMemesModel.instance.count() == 0 {
            self.performSegue(withIdentifier: "showEditorFromList", sender: nil)
        }
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
        
        cell.setupCellWith(meme: meme)
        
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
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            SentMemesModel.instance.delete(atIndex: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
}
