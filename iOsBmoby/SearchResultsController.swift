//
//  SearchResultsController.swift
//  PlacesLookup
//
//  Created by Malek T. on 9/30/15.
//  Copyright © 2015 Medigarage Studios LTD. All rights reserved.
//

import UIKit
import GoogleMaps



class SearchResultsController: UITableViewController {
    
    var searchResults: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchResults = Array()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.searchResults.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.searchResults[indexPath.row]
        return cell
    }
    
    
    
    override func tableView(tableView: UITableView,
                            didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        currentCity = (cell!.textLabel?.text)!
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        print("page changed")
        
        
        let tab: UITabBarController = storyBoard.instantiateViewControllerWithIdentifier("HomeTab") as! UITabBarController
        tab.selectedIndex = 0
        self.presentViewController(tab, animated: true, completion: nil)
    }
    
    
    func reloadDataWithArray(array:[String]){
        self.searchResults = array
        self.tableView.reloadData()
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}