//
//  citiesVC.swift
//  iOsBmoby
//
//  Created by Magomed Souleymnov on 21/09/2016.
//  Copyright © 2016 BMoby. All rights reserved.
//

import UIKit
import Parse

var currentCity: String?

class citiesVC: UICollectionViewController {
    
    // Declaration of variables
    var refresher: UIRefreshControl!
    var citiesNames = [String]()
    var citiesImages = [PFFile]()
    var hello:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Background is black by default
        collectionView?.backgroundColor = UIColor.whiteColor()
        
        // Option to refresh the page with scrolling to the bottom -> related to the refresh() action
        refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(citiesVC.refresh), forControlEvents: UIControlEvents.ValueChanged)
        collectionView?.addSubview(refresher)
        // Action to load the collection of cities with icons and names from DB
        loadCities()
        
        print(currentCity)
    }
    
    // ---------------------------------------------------------------------------------------------------
    // REFRESHER OF THE PAGE------------------------------------------------------------------------------
    func refresh(){
        collectionView?.reloadData()
        refresher.endRefreshing()
    }
    // ---------------------------------------------------------------------------------------------------
    // ACTION TO LOAD THE CITIES--------------------------------------------------------------------------
    func loadCities(){

        let query = PFQuery(className: "cities")
        query.limit = 10
        query.findObjectsInBackgroundWithBlock ({ (objects:[PFObject]?, error: NSError?) in
            if error == nil{
                // Clean up
                self.citiesNames.removeAll(keepCapacity: false)
                self.citiesImages.removeAll(keepCapacity: false)
                
                //Find related objects to our Query
                for object in objects!{
                    // add found data to arrays
                    self.citiesNames.append(object.valueForKey("name") as! String)
                    self.citiesImages.append(object.valueForKey("icon") as! PFFile)
                }
                // Reload data of the collectionView after that the arrays are completed with data
                self.collectionView!.reloadData()
            }else{
                print(error!.localizedDescription)
            }
        })
    }
    // ---------------------------------------------------------------------------------------------------
    // DECLARING A HEADER OF TYPE citiesHeader.swift------------------------------------------------------
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "CitiesHeader", forIndexPath: indexPath) as! citiesHeader
        
        
        return header
    }
    // ---------------------------------------------------------------------------------------------------
    // DECLARING A CELL OF TYPE citiesCell ---------------------------------------------------------------
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CitiesCell", forIndexPath: indexPath) as! citiesCell
        citiesImages[indexPath.row].getDataInBackgroundWithBlock ({ (data:NSData?, error:NSError?) in
            if error == nil {
                cell.citiesCellImg.image = UIImage(data: data!)
                cell.citiesCellNameLbl.text = self.citiesNames[indexPath.row]
            }else{
                print(error!.localizedDescription)
            }
        })
        return cell
    }
    // ---------------------------------------------------------------------------------------------------
    // CHANGE THE VALUE OF CURRENTCITY WITH SELECTION ----------------------------------------------------
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! citiesCell
        currentCity = cell.citiesCellNameLbl.text
        print(currentCity)
    }

    // ---------------------------------------------------------------------------------------------------
    // DECLARING THE NUMBER OF ITEMS TO SHOW -------------------------------------------------------------
       override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citiesImages.count
    }
    // ---------------------------------------------------------------------------------------------------
}
