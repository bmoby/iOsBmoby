//
//  HomeVC.swift
//  iOsBmoby
//
//  Created by Oulachyov  on 9/21/16.
//  Copyright © 2016 BMoby. All rights reserved.
//

import UIKit
import Parse

class homeVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Chage the numbers pushing the buttton "+" and "-"
    var nb = Int()
    
    //To show hidden itmes
    var showAmenities = [UILabel]()
    var showAmenitiesBtn = [UIButton]()
    
    //To do some actions on tapping the label items
    var lbl = [UILabel]()
    
    var ownColor = UIColor(red: 228.0/255.0, green: 98.0/255.0, blue: 92.0/255.0, alpha: 1)
    var grayColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1)
    
    //Scrollview
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Bmoby logo
    @IBOutlet weak var bmobyImg: UIImageView!
    
    // Listing price
    
    @IBOutlet weak var priceSlider: UISlider!
    
    // Number of guests
    @IBOutlet weak var guestIconLbl: UILabel!
    @IBOutlet weak var nbGuestLbl: UILabel!
    @IBOutlet weak var guestLbl: UILabel!
    @IBOutlet weak var removeGuestBtn: UIButton!
    @IBOutlet weak var addGuestBtn: UIButton!

    // Number of nights
    @IBOutlet weak var nightIconLbl: UILabel!
    @IBOutlet weak var nbNightLbl: UILabel!
    @IBOutlet weak var nightLbl: UILabel!
    @IBOutlet weak var removeNightBtn: UIButton!
    @IBOutlet weak var addNightBtn: UIButton!
    
    // Chechin time
    @IBOutlet weak var checkinLbl: UILabel!
    @IBOutlet weak var checkinHourTxt: UITextField!
    
  
    
    // Accomodation type
    @IBOutlet weak var sharedRoomLbl: UILabel!
    @IBOutlet weak var privateRoomLbl: UILabel!
    @IBOutlet weak var entirePlaceLbl: UILabel!
    
    // Show all amenities
    @IBOutlet weak var allAmenities: UIButton!
    
    //Amneties
    @IBOutlet weak var amenitiesBtn: UIButton!
    
    //Number of bedrooms
    @IBOutlet weak var nbBedroomLbl: UILabel!
    @IBOutlet weak var bedroomLbl: UILabel!
    @IBOutlet weak var removeBedroomBtn: UIButton!
    @IBOutlet weak var addBedroomBtn: UIButton!
    
    
    //Number of bathrooms
    @IBOutlet weak var nbBathroomLbl: UILabel!
    @IBOutlet weak var bathroomLbl: UILabel!
    @IBOutlet weak var removeBathroomBtn: UIButton!
    @IBOutlet weak var addBathroomBtn: UIButton!
    
    
    //Number of beds
    @IBOutlet weak var nbBedLbl: UILabel!
    @IBOutlet weak var bedLbl: UILabel!
    @IBOutlet weak var removeBedBtn: UIButton!
    @IBOutlet weak var addBedBtn: UIButton!

    @IBOutlet weak var kitchenLbl: UILabel!
    @IBOutlet weak var breakfastLbl: UILabel!
    @IBOutlet weak var wifiInternetLbl: UILabel!
    @IBOutlet weak var wheelchairAccessible: UILabel!
    @IBOutlet weak var tvLbl: UILabel!
    @IBOutlet weak var lockForBedroom: UILabel!
    @IBOutlet weak var elevatorLbl: UILabel!
    @IBOutlet weak var dryerLbl: UILabel!
    @IBOutlet weak var washerLbl: UILabel!
    @IBOutlet weak var ironLbl: UILabel!
    @IBOutlet weak var hairDryerLbl: UILabel!
    @IBOutlet weak var smokingAllowedLbl: UILabel!
    @IBOutlet weak var intercomLbl: UILabel!
    @IBOutlet weak var airConditioningLbl: UILabel!
    @IBOutlet weak var familyKidLbl: UILabel!
    @IBOutlet weak var petsAllowed: UILabel!
    @IBOutlet weak var parkignLbl: UILabel!
    @IBOutlet weak var indoorFireplaceLbl: UILabel!
    @IBOutlet weak var gymLbl: UILabel!
    @IBOutlet weak var poolLbl: UILabel!
    @IBOutlet weak var saunaLbl: UILabel!
    @IBOutlet weak var hammamLbl: UILabel!
    @IBOutlet weak var jacuzziLbl: UILabel!
    
    //Host spoken langages 
    @IBOutlet weak var hostLanguagesLbl: UILabel!
    @IBOutlet weak var englishLbl: UILabel!
    @IBOutlet weak var frenchLbl: UILabel!
    @IBOutlet weak var spanishLbl: UILabel!
    @IBOutlet weak var germanLbl: UILabel!
    @IBOutlet weak var chineseLbl: UILabel!
    @IBOutlet weak var italianLbl: UILabel!
    @IBOutlet weak var portugueseLbl: UILabel!
    @IBOutlet weak var dutchLbl: UILabel!
    @IBOutlet weak var russianLbl: UILabel!
    @IBOutlet weak var arabicLbl: UILabel!
    @IBOutlet weak var japaneseLbl: UILabel!
    
    // Launch research of listing
    @IBOutlet weak var findHostsBtn: UIButton!
    
    //Pickerview and picker data
    var hourPicker : UIPickerView!
    let hour = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Scroll view 
        scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        scrollView.contentSize.height = 1200
        
        
        //Create hour picker 
        hourPicker = UIPickerView()
        hourPicker.dataSource = self
        hourPicker.delegate = self
        hourPicker.backgroundColor = UIColor.groupTableViewBackgroundColor()
        hourPicker.showsSelectionIndicator = true
        checkinHourTxt.inputView = hourPicker
        
        
        
        // Show amenities array
        showAmenities = [ nbBedroomLbl, bedroomLbl, nbBathroomLbl, bathroomLbl,nbBedLbl, bedLbl,kitchenLbl, breakfastLbl, wifiInternetLbl, wheelchairAccessible, tvLbl, lockForBedroom, elevatorLbl, dryerLbl, washerLbl, ironLbl, hairDryerLbl, smokingAllowedLbl, intercomLbl, airConditioningLbl, familyKidLbl, petsAllowed, parkignLbl, indoorFireplaceLbl, gymLbl, poolLbl, saunaLbl, hammamLbl, jacuzziLbl, hostLanguagesLbl,englishLbl, frenchLbl, spanishLbl, germanLbl, chineseLbl, italianLbl, portugueseLbl, dutchLbl, russianLbl, arabicLbl, japaneseLbl]
        
        //Show amenities' buttons 
        showAmenitiesBtn = [removeBedroomBtn, addBedroomBtn, removeBathroomBtn, addBathroomBtn,  addBedBtn, removeBedBtn, addBedBtn]
        
        lbl = [sharedRoomLbl, privateRoomLbl, entirePlaceLbl, kitchenLbl, breakfastLbl, wifiInternetLbl, wheelchairAccessible, tvLbl, lockForBedroom, elevatorLbl, dryerLbl, washerLbl, ironLbl, hairDryerLbl, smokingAllowedLbl, intercomLbl, airConditioningLbl, familyKidLbl, petsAllowed, parkignLbl, indoorFireplaceLbl, gymLbl, poolLbl, saunaLbl, hammamLbl, jacuzziLbl , englishLbl, frenchLbl, spanishLbl, germanLbl, chineseLbl, italianLbl, portugueseLbl, dutchLbl, russianLbl, arabicLbl, japaneseLbl]
        
        // Tap gesture recognizer for "all amenities"
        for object in lbl {
            let tapLbl =  UITapGestureRecognizer(target: self, action: #selector(homeVC.tapLbl(_:)))
            tapLbl.numberOfTapsRequired = 1
            object.userInteractionEnabled = true
            object.addGestureRecognizer(tapLbl)
        }
        
    }
    
    
    // Add or remove number of guests -----------------------------------------------------------------------
    @IBAction func removeGuestBtn_clicked(sender: AnyObject) {
        nb = Int(nbGuestLbl.text!)!
        nbGuestLbl.text = String(nb-1)
        if nb == 1 {
            nbGuestLbl.text = String(1)
        }
    }
    
    @IBAction func addGuestBtn_clicked(sender: AnyObject) {
        nb = Int(nbGuestLbl.text!)!
        nbGuestLbl.text = String(nb+1)
    }
    
    
    //Add or remove number of nights-------------------------------------------------------------------------
    @IBAction func removeNightBtn_clicked(sender: AnyObject) {
        nb = Int(nbNightLbl.text!)!
        nbNightLbl.text = String(nb-1)
        if nb == 1 {
            nbNightLbl.text = String(1)
        }
    }
    
    
    @IBAction func addNightBtn_clicked(sender: AnyObject) {
        nb = Int(nbNightLbl.text!)!
        nbNightLbl.text = String(nb+1)
    }
    
    //--------------------------------------------PICKER VIEW METHODS----------------------------------------
    // number of components: one component the string array og hour
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hour.count
    }
    
    //number of items to be selected
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hour[row]
    }
    
    //picker text config
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        checkinHourTxt.text = hour[row]
        self.view.endEditing(true)
    }
    
    
    //Add or remove number of bedroom------------------------------------------------------------------------
    @IBAction func removeBedroomBtn_clicked(sender: AnyObject) {
        nb = Int(nbBedroomLbl.text!)!
        nbBedroomLbl.text = String(nb-1)
        if nb == 1 {
            nbBedroomLbl.text = String(1)
        }
    }
    
    @IBAction func addBedroomBtn_clicked(sender: AnyObject) {
        nb = Int(nbBedroomLbl.text!)!
        nbBedroomLbl.text = String(nb+1)
    }
    
    
    //Add or remove number of bathroom-----------------------------------------------------------------------
    @IBAction func removeBathroomBtn_clicked(sender: AnyObject) {
        nb = Int(nbBathroomLbl.text!)!
        nbBathroomLbl.text = String(nb-1)
        if nb == 1 {
            nbBathroomLbl.text = String(1)
        }
    }
    
    @IBAction func addBathroomBtn_clicked(sender: AnyObject) {
        nb = Int(nbBathroomLbl.text!)!
        nbBathroomLbl.text = String(nb+1)
    }
    
    
    //Add or remove number of bed----------------------------------------------------------------------------
    @IBAction func removeBedBtn_clicked(sender: AnyObject) {
        nb = Int(nbBedLbl.text!)!
        nbBedLbl.text = String(nb-1)
        if nb == 1 {
            nbBedLbl.text = String(1)
        }
    }
    
    @IBAction func addBedBtn_clicked(sender: AnyObject) {
        nb = Int(nbBedLbl.text!)!
        nbBedLbl.text = String(nb+1)
    }
    
    // Show amenities if amenities button clicked-----------------------------------------------------------
    @IBAction func amenitiesBtn_clicked(sender: AnyObject) {
        amenitiesBtn.hidden = true
        findHostsBtn.hidden = true
        
        //show labels
        for object in showAmenities {
        object.hidden = false
        }
        
        // show buttons
        for object in showAmenitiesBtn {
            object.hidden = false
        }
    }
    
    // choose amenity ---------------------------------------------------------------------------------------
    func tapLbl(sender: UITapGestureRecognizer) {
        let lbl = sender
        if lbl.view?.backgroundColor == grayColor {
            lbl.view!.backgroundColor = ownColor
            scrollView.contentSize.height = 1300
        }
        else {
            lbl.view!.backgroundColor = grayColor
            scrollView.contentSize.height = self.view.frame.height
        }
    }

    /*
    func tapLbl() {
        if amenitiesBtn.backgroundColor == grayColor {
            amenitiesBtn.backgroundColor = ownColor
            scrollView.contentSize.height = 1300
        }
        else {
            amenitiesBtn.backgroundColor = grayColor
            scrollView.contentSize.height = self.view.frame.height
        }
    } */
    

    
    //-----------------------------------------
    
    //picker did selected sime value from it
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}







