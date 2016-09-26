//
//  createListingVC.swift
//  iOsBmoby
//
//  Created by Oulachyov  on 9/25/16.
//  Copyright © 2016 BMoby. All rights reserved.
//

import UIKit
import Parse

class createListingVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    @IBOutlet weak var priceTxt: UITextField!
    @IBOutlet weak var nbGuest: UITextField!
    @IBOutlet weak var minNights: UITextField!
    @IBOutlet weak var checkin: UITextField!
    @IBOutlet weak var accomodationType: UITextField!
    @IBOutlet weak var nbBedrooms: UITextField!
    @IBOutlet weak var nbBathrooms: UITextField!
    @IBOutlet weak var nbBeds: UITextField!
    
    @IBOutlet weak var kitchen: UITextField!
    @IBOutlet weak var breakfast: UITextField!
    @IBOutlet weak var wifiInternet: UITextField!
    @IBOutlet weak var wheelchair: UITextField!
    @IBOutlet weak var tv: UITextField!
    @IBOutlet weak var lockForBedroom: UITextField!
    @IBOutlet weak var elevator: UITextField!
    @IBOutlet weak var dryer: UITextField!
    @IBOutlet weak var washer: UITextField!
    @IBOutlet weak var iron: UITextField!
    @IBOutlet weak var hairDryer: UITextField!
    @IBOutlet weak var smokingAllowed: UITextField!
    @IBOutlet weak var intercom: UITextField!
    @IBOutlet weak var airconditioning: UITextField!
    @IBOutlet weak var familyKid: UITextField!
    @IBOutlet weak var petsAllowed: UITextField!
    @IBOutlet weak var parking: UITextField!
    @IBOutlet weak var indoorFireplace: UITextField!
    @IBOutlet weak var gym: UITextField!
    @IBOutlet weak var pool: UITextField!
    @IBOutlet weak var sauna: UITextField!
    @IBOutlet weak var hammam: UITextField!
    @IBOutlet weak var jacuzzi: UITextField!
    
    @IBOutlet weak var english: UITextField!
    @IBOutlet weak var french: UITextField!
    @IBOutlet weak var spanish: UITextField!
    @IBOutlet weak var german: UITextField!
    @IBOutlet weak var chinese: UITextField!
    @IBOutlet weak var italiann: UITextField!
    @IBOutlet weak var portuguese: UITextField!
    @IBOutlet weak var dutch: UITextField!
    @IBOutlet weak var russian: UITextField!
    @IBOutlet weak var arabic: UITextField!
    @IBOutlet weak var japanese: UITextField!
    
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var province: UITextField!
    @IBOutlet weak var street: UITextField!
    @IBOutlet weak var streetNb: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var state: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        scrollView.contentSize.height = 1200
    }
    
    @IBAction func sendDataBtn(sender: AnyObject) {
        
        let listing = PFObject(className: "listings")
        
        listing["airConditioning"] = airconditioning.text?.lowercaseString
        listing["animalsAllowed"] = petsAllowed.text?.lowercaseString
        listing["bathrooms"] = nbBathrooms.text?.lowercaseString
        listing["bedrooms"] = nbBedrooms.text?.lowercaseString
        listing["beds"] = nbBeds.text?.lowercaseString
        listing["breakfast"] = breakfast.text?.lowercaseString
        listing["checkIn"] = checkin.text?.lowercaseString
        listing["city"] = city.text?.lowercaseString
        listing["country"] = country.text?.lowercaseString
        listing["elevator"] = elevator.text?.lowercaseString
        listing["accomodationType"] = accomodationType.text?.lowercaseString
        listing["guests"] = nbGuest.text?.lowercaseString
        listing["gym"] = gym.text?.lowercaseString
        listing["hairDryer"] = hairDryer.text?.lowercaseString
        listing["hammam"]  = hammam.text?.lowercaseString
        listing["hostLanguageArabic"] = arabic.text?.lowercaseString
        listing["hostLanguageChina"] = chinese.text?.lowercaseString
        listing["hostLanguageDutch"] = dutch.text?.lowercaseString
        listing["hostLanguageEnglish"] = english.text?.lowercaseString
        listing["hostLanguageFrench"] = french.text?.lowercaseString
        listing["hostLanguageGerman"] = german.text?.lowercaseString
        listing["hostLanguageItalien"] = italiann.text?.lowercaseString
        listing["hostLanguageJapanese"] = japanese.text?.lowercaseString
        listing["hostLanguagePortuguese"] = portuguese.text?.lowercaseString
        listing["hostLanguageRussian"] = russian.text?.lowercaseString
        listing["hostLanguageSpanish"] = spanish.text?.lowercaseString
        listing["intercom"] = intercom.text?.lowercaseString
        listing["iron"] = iron.text?.lowercaseString
        listing["jacuzzi"] = jacuzzi.text?.lowercaseString
        listing["kidFamilyFriendly"] = familyKid.text?.lowercaseString
        listing["kitchen"] = kitchen.text?.lowercaseString
        listing["lockOnBedroomDoor"] = lockForBedroom.text?.lowercaseString
        listing["nights"] = minNights.text?.lowercaseString
        listing["parking"] = parking.text?.lowercaseString
        listing["pool"] = pool.text?.lowercaseString
        listing["price"] = priceTxt.text?.lowercaseString
        listing["province"] = province.text?.lowercaseString
        listing["sauna"] = sauna.text?.lowercaseString
        listing["smokingAllowed"] = smokingAllowed.text?.lowercaseString
        listing["streetName"] = street.text?.lowercaseString
        listing["streetNb"] = streetNb.text?.lowercaseString
        listing["tv"] = tv.text?.lowercaseString
        listing["uid"] = "1"
        listing["washer"]  = washer.text?.lowercaseString
        listing["wheelchairAccessible"] = wheelchair.text?.lowercaseString
        listing["wifiInternet"] = wifiInternet.text?.lowercaseString
        listing["zipPostal"] = zipCode.text?.lowercaseString
        listing["latitude"]  = ""
        listing ["longitude"] = ""
        
        if state.text!.isEmpty {
            listing["state"] = ""
        }
        else {
          listing["state"] = state.text?.lowercaseString
        }
        
        let imageData1 = UIImageJPEGRepresentation(image1.image!, 0.5)
        let imageFile1 = PFFile(name: "image.jpg", data: imageData1!)
        if image1.image == nil {
            listing ["image01"] = ""
        }
        else {
            listing ["image01"] = imageFile1
        }
        
        let imageData2 = UIImageJPEGRepresentation(image2.image!, 0.5)
        let imageFile2 = PFFile(name: "image.jpg", data: imageData2!)
        if image2.image == nil {
            listing ["image02"] = ""
        }
        else {
            listing ["image02"] = imageFile2
        }
        
        let imageData3 = UIImageJPEGRepresentation(image3.image!, 0.5)
        let imageFile3 = PFFile(name: "image.jpg", data: imageData3!)
        if image3.image == nil {
            listing ["image03"] = ""
        }
        else {
            listing ["image03"] = imageFile3
        }
    
        let imageData4 = UIImageJPEGRepresentation(image4.image!, 0.5)
        let imageFile4 = PFFile(name: "image.jpg", data: imageData4!)
        if image4.image == nil {
            listing ["image04"] = ""
        }
        else {
            listing ["image04"] = imageFile4
        }
        
        let imageData5 = UIImageJPEGRepresentation(image5.image!, 0.5)
        let imageFile5 = PFFile(name: "image.jpg", data: imageData5!)
        if image5.image == nil {
            listing ["image05"] = ""
        }
        else {
            listing ["image05"] = imageFile5
        }
        
        let imageData6 = UIImageJPEGRepresentation(image6.image!, 0.5)
        let imageFile6 = PFFile(name: "image.jpg", data: imageData6!)
        if image6.image == nil {
            listing ["image06"] = ""
        }
        else {
            listing ["image06"] = imageFile6
        }
        
        if image7.image == nil {
            listing ["image7"] = ""
        }
        else {
            let imageData7 = UIImageJPEGRepresentation(image7.image!, 0.5)
            let imageFile7 = PFFile(name: "image.jpg", data: imageData7!)
            listing ["image7"] = imageFile7
        }
        
        if image8.image == nil {
            listing ["image08"] = ""
        }
        else {
            let imageData8 = UIImageJPEGRepresentation(image8.image!, 0.5)
            let imageFile8 = PFFile(name: "image.jpg", data: imageData8!)
            listing ["image08"] = imageFile8
        }
        
        if image9.image == nil {
            listing ["image09"] = ""
        }
        else {
            let imageData9 = UIImageJPEGRepresentation(image9.image!, 0.5)
            let imageFile9 = PFFile(name: "image.jpg", data: imageData9!)
            listing ["image09"] = imageFile9
        }
        
        listing.saveInBackgroundWithBlock { (success: Bool, error: NSError?) in
            if success {
                print("saved")
            }
            else {
                print(error)
            }
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
