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
    
    @IBOutlet var homeView: UIView!
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
    @IBOutlet weak var checkinMinTxt: UITextField!
    
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
    var hour:String = ""
    var min:String = ""
    var hourPicker : UIPickerView!
    let checkinData = [["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"], ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60"] ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Scroll view 
        scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        var contentRect = CGRectZero
        for view: UIView in self.scrollView.subviews {
            contentRect = CGRectUnion(contentRect, view.frame)
        }
        self.scrollView.contentSize = contentRect.size
        
        //Create hour picker 
        hourPicker = UIPickerView()
        hourPicker.dataSource = self
        hourPicker.delegate = self
        hourPicker.backgroundColor = UIColor.groupTableViewBackgroundColor()
        hourPicker.showsSelectionIndicator = true
        checkinHourTxt.inputView = hourPicker
        checkinMinTxt.inputView = hourPicker
        
        
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
        return checkinData.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return checkinData[component].count
    }
    
    //number of items to be selected
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return checkinData[component][row]
    }
    
    //picker text config
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch (component){
        case 0:
            hour = checkinData[component][row]
            checkinHourTxt.text = hour
        case 1:
            min = checkinData[component][row]
            checkinMinTxt.text = min
        default:break
        }
        
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
        }
        else {
            lbl.view!.backgroundColor = grayColor
        }
    }
    
    //-----------------------------------------
    
    //picker did selected sime value from it
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}







