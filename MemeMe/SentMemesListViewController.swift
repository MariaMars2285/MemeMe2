//
//  SentMemesListViewController.swift
//  MemeMe
//
//  Created by Maria  on 9/12/17.
//  Copyright © 2017 Maria . All rights reserved.
//

import UIKit

class SentMemesListViewController: UITableViewController {
    
    var data: [Meme] = [
        Meme(topText: "Maria", bottomText: "Selvam", originalImage: UIImage(named: "LaunchImage")!, memedImage: UIImage(named: "LaunchImage")!),
        Meme(topText: "hello", bottomText: "hi", originalImage: UIImage(named: "LaunchImage")!, memedImage: UIImage(named: "LaunchImage")!),
        Meme(topText: "test", bottomText: "tool", originalImage: UIImage(named: "Grid")!, memedImage: UIImage(named: "Grid")!),
        Meme(topText: "test", bottomText: "three", originalImage: UIImage(named: "LaunchImage")!, memedImage: UIImage(named: "LaunchImage")!),
        Meme(topText: "you", bottomText: "helo", originalImage: UIImage(named: "Grid")!, memedImage: UIImage(named: "Grid")!)]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        
        let meme = data[indexPath.row]
        
        cell.topLabel.text = meme.topText
        cell.bottomLabel.text = meme.bottomText
        cell.fullText.text = (meme.topText ?? "") + "..." + (meme.bottomText ?? "")
        cell.memeImageView.image = meme.originalImage

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
