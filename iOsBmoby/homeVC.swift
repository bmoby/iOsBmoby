//
//  HomeVC.swift
//  iOsBmoby
//
//  Created by Oulachyov  on 9/21/16.
//  Copyright © 2016 BMoby. All rights reserved.
//

import UIKit
import Parse

//Colors
var ownColor = UIColor(red: 228.0/255.0, green: 98.0/255.0, blue: 92.0/255.0, alpha: 1)
var grayColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1)



class homeVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Pickerview and picker data
    var hour:String = ""
    var minute:String = ""
    var checkinPicker: UIPickerView!
    var checkinData = [["any hour","00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"], ["any minute","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60"] ]
    
    
    //------------------------------------------Declared variables------------------------------------------------
    //Chage the numbers pushing the buttton "+" and "-"
    var nb = Int()
    
    //To do some actions on tapping the label items
    var lblChoose = [UILabel]()
    
    //-------------------------------------------Outlets------------------------------------------------------------
    //send from checking page
    @IBOutlet weak var checkingHostsAvailabilityLbl: UILabel!
    @IBOutlet weak var checkingCityLbl: UILabel!
    
    //amenities and hosts languafges View
    @IBOutlet weak var amenitiesView: UIView!
    @IBOutlet weak var hostLanguagesView: UIView!
    
    @IBOutlet var homeView: UIView!
    //Scrollview
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Bmoby logo
    @IBOutlet weak var bmobyImg: UIImageView!
    
    //Slider var
    var slider: RangeSlider = RangeSlider()
    
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
    @IBOutlet weak var hostLanguagesBtn: UIButton!
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
    
    
    //Arrays collecting data to send a request
    var chooseData = [String]()
    var listingData: listing = listing()
    
    //default function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Checking city 
        checkingCity()
        
        //Scroll view 
        scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        var contentRect = CGRectZero
        for view: UIView in self.scrollView.subviews {
            contentRect = CGRectUnion(contentRect, view.frame)
        }
        self.scrollView.contentSize = contentRect.size
        
    
        //Slider 
        slider.frame = CGRectMake(22, 130, self.view.frame.width - 60, 20)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.lowerValue = 20
        slider.upperValue = 70
        slider.trackHighlightTintColor = ownColor
        slider.thumbTintColor = UIColor.whiteColor()
        slider.curvaceousness = 1.0
        self.scrollView.addSubview(slider)
        
        //Create checkin picker
        checkinPicker = UIPickerView()
        checkinPicker.dataSource = self
        checkinPicker.delegate = self
        checkinPicker.backgroundColor = UIColor.groupTableViewBackgroundColor()
        checkinPicker.showsSelectionIndicator = true
        checkinHourTxt.inputView = checkinPicker
        checkinMinTxt.inputView = checkinPicker
        
        // choose optional data: amenities and languqges
        lblChoose = [sharedRoomLbl, privateRoomLbl, entirePlaceLbl, kitchenLbl, breakfastLbl, wifiInternetLbl, wheelchairAccessible, tvLbl, lockForBedroom, elevatorLbl, dryerLbl, washerLbl, ironLbl, hairDryerLbl, smokingAllowedLbl, intercomLbl, airConditioningLbl, familyKidLbl, petsAllowed, parkignLbl, indoorFireplaceLbl, gymLbl, poolLbl, saunaLbl, hammamLbl, jacuzziLbl , englishLbl, frenchLbl, spanishLbl, germanLbl, chineseLbl, italianLbl, portugueseLbl, dutchLbl, russianLbl, arabicLbl, japaneseLbl]
        
        // Tap gesture recognizer for "all amenities"
        for object in lblChoose {
            let tapLbl =  UITapGestureRecognizer(target: self, action: #selector(homeVC.tapLbl(_:)))
            tapLbl.numberOfTapsRequired = 1
            object.userInteractionEnabled = true
            object.addGestureRecognizer(tapLbl)
        }
        
    }
    
    
    // checking city function -------------------------------------------------------------------------------
    func checkingCity() {
        if currentCity == nil {
            checkingCityLbl.text = nil
            checkingCityLbl.hidden = true
            checkingHostsAvailabilityLbl.hidden = true
        }
        else {
            checkingCityLbl.text = currentCity
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
            minute = checkinData[component][row]
            checkinMinTxt.text = minute 
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
        if amenitiesView.hidden {
            amenitiesView.hidden = false
        }
        else {
            amenitiesView.hidden = true
        }
    }
    
    
    //choose host languages----------------------------------------------------------------------------------
    @IBAction func hostLanguagesBtn_clicked(sender: AnyObject) {
        if hostLanguagesView.hidden {
            hostLanguagesView.hidden = false
        }
        else {
            hostLanguagesView.hidden = true
        }
    }
    
    
    // choose amenities and languages  -------------------------------------------------------------------------
    func tapLbl(sender: UITapGestureRecognizer) {
        let lblChoose = sender
        if lblChoose.view?.backgroundColor == grayColor {
            lblChoose.view!.backgroundColor = ownColor
        }
        else {
            lblChoose.view!.backgroundColor = grayColor
        }
    }
    
    
    //Find hosts
    @IBAction func findHostsBtn_clicked(sender: AnyObject) {
        
        // if guest doesn't choose any time for checking in, the default will be "any hour" and "any minute"
        if checkinHourTxt.text == "hour" {
            checkinHourTxt.text = "any hour"
        }
        
        if checkinMinTxt.text == "min" {
            checkinMinTxt.text = "any minute"
        }
        
        let checkinTime = checkinHourTxt.text! + ":" + checkinMinTxt.text!
        
        chooseData.removeAll(keepCapacity: false)
        for object in lblChoose {
            if object.backgroundColor == ownColor {
                self.chooseData.append(object.text!)
            }
        }
        print(chooseData)
        
        //find related listings
        let listingQuaery = PFQuery(className: "listings")
        for object in chooseData {
            listingQuaery.whereKey("\(object)", equalTo: "yes")
        }
        listingQuaery.whereKey("guest", equalTo: nbGuestLbl.text!)
        listingQuaery.whereKey("night", equalTo: nbNightLbl.text!)
        listingQuaery.whereKey("checkin", equalTo: checkinTime)
        listingQuaery.whereKey("bedroom", equalTo: nbBedroomLbl.text!)
        listingQuaery.whereKey("bathroom", equalTo: nbBathroomLbl.text!)
        listingQuaery.whereKey("bed", equalTo: nbBedLbl.text!)
        listingQuaery.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) in
            if error == nil {
                
                for object in objects! {
                    self.listingData.uuid = (object.valueForKey("uuid") as! String)
                    self.listingData.guests = (object.valueForKey("guest") as! String)
                    self.listingData.nights = (object.valueForKey("night") as! String)
                    self.listingData.checkIn = (object.valueForKey("checkin") as! String)
                    self.listingData.bedrooms = (object.valueForKey("bedroom") as! String)
                    self.listingData.bathrooms = (object.valueForKey("bathroom") as! String)
                    self.listingData.beds = (object.valueForKey("bed") as! String)
                }
                print(self.listingData)
            }
        }
        
    }
    
    
    

    
  //---------------------------------------------------------------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}







