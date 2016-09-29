//
//  createListingVC.swift
//  iOsBmoby
//
//  Created by Oulachyov  on 9/25/16.
//  Copyright © 2016 BMoby. All rights reserved.
//

import UIKit
import Parse

var picker: UIPickerView!

class createListingVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Days and month picker and data
    var minNightPicker, maxNightPicker: UIPickerView!
    //var maxNightPicker: UIPickerView!
    var day: String = ""
    var month: String = ""
    var minNightData = ["minimum number of days","minimum number of months"]
    var maxNightData = ["maximum number of days","maximum number of months"]
    
    
    //checkin pickerview and picker data
    var hour:String = ""
    var minute:String = ""
    var checkinPicker: UIPickerView!
    var checkinData = [["any hour","00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"], ["any minute","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60"] ]
    
    
    //accommodation type picker and picker data 
    var accomTypePicker: UIPickerView!
    var accomTypeData = ["shared room", "private room", "entire place"]
    
    
    //Chage the numbers pushing the buttton "+" and "-"
    var nb = Int()
    
    //To do some actions on tapping the label items
    var lblChoose = [UILabel]()
    
        
    @IBOutlet weak var scrollView: UIScrollView!

    //listing pics
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    //accomodation adress
    @IBOutlet weak var accommodationAdressLbl: UILabel!
    @IBOutlet weak var homeNumberTxt: UITextField!
    @IBOutlet weak var streetNameTxt: UITextField!
    @IBOutlet weak var zipCodeTxt: UITextField!
    @IBOutlet weak var provinceTxt: UITextField!
    @IBOutlet weak var stateTxt: UITextField!
    @IBOutlet weak var geolocationBtn: UIButton!
    
    //price 
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var priceTxt: UITextField!
    
    //number of guests
    @IBOutlet weak var nbGuestLbl: UILabel!
    @IBOutlet weak var guestLbl: UILabel!
    @IBOutlet weak var removeGuestBtn: UIButton!
    @IBOutlet weak var addGuestBtn: UIButton!
    
    //number of min and max nights
    @IBOutlet weak var nbMinNightsLbl: UILabel!
    @IBOutlet weak var minNightTxtPicker: UITextField!
    @IBOutlet weak var removeMinNightBtn: UIButton!
    @IBOutlet weak var addMinNightBtn: UIButton!
    @IBOutlet weak var nbMaxNightLbl: UILabel!
    @IBOutlet weak var maxNightTxtPicker: UITextField!
    @IBOutlet weak var removeMaxNigthBtn: UIButton!
    
    //checkin time picker
    @IBOutlet weak var checkinLbl: UILabel!
    @IBOutlet weak var checkinTxt: UITextField!

    
    //accommodation type picker
    @IBOutlet weak var accommodationTypeTxt: UITextField!
    
    //bedroom
    @IBOutlet weak var nbBedroomLbl: UILabel!
    @IBOutlet weak var bedroomLbl: UILabel!
    @IBOutlet weak var removeBedroomBtn: UIButton!
    @IBOutlet weak var addBedroomBtn: UIButton!
    
    //Bathroom
    @IBOutlet weak var nbBathroomLbl: UILabel!
    @IBOutlet weak var bathroomLbl: UILabel!
    @IBOutlet weak var removeBathroomBtn: UIButton!
    @IBOutlet weak var addBathroomBtn: UIButton!
    
    //bed
    @IBOutlet weak var nbBedLbl: UILabel!
    @IBOutlet weak var bedLbl: UILabel!
    @IBOutlet weak var removeBedBtn: UIButton!
    @IBOutlet weak var addBedBtn: UIButton!
    
    //amenities
    @IBOutlet weak var amenitiesLbl: UILabel!
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
    
    //Reset default size
    var scrollViewHeight: CGFloat = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Scroll view
        scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        scrollView.contentSize.height = 1500
        scrollViewHeight = scrollView.frame.size.height
        
        //checkin picker
        checkinPicker = UIPickerView()
        checkinPicker.dataSource = self
        checkinPicker.delegate = self
        checkinPicker.backgroundColor = UIColor.groupTableViewBackgroundColor()
        checkinPicker.showsSelectionIndicator = true
        checkinTxt.inputView = checkinPicker
        
        /*
         let smallerPicker = UIPickerView(frame: CGRectMake(0, 0, 320.0, 50.0))
          checkinPicker = smallerPicker
        //picker view size
        let t0 = CGAffineTransformMakeTranslation(0, checkinPicker.bounds.size.height / 2)
        let s0 = CGAffineTransformMakeScale(1.0, 0.5)
        let t1 = CGAffineTransformMakeTranslation(0, -checkinPicker.bounds.size.height / 2)
        checkinPicker.transform = CGAffineTransformConcat(t0, CGAffineTransformConcat(s0, t1))
        */
        
        //minimum day/month picker
        minNightPicker = UIPickerView()
        minNightPicker.dataSource = self
        minNightPicker.delegate = self
        minNightPicker.backgroundColor = UIColor.groupTableViewBackgroundColor()
        minNightPicker.showsSelectionIndicator = true
        minNightTxtPicker.inputView = minNightPicker
        
        //maximum day/month picker
        maxNightPicker = UIPickerView()
        maxNightPicker.dataSource = self
        maxNightPicker.delegate = self
        maxNightPicker.backgroundColor = UIColor.groupTableViewBackgroundColor()
        maxNightPicker.showsSelectionIndicator = true
        maxNightTxtPicker.inputView = maxNightPicker
        
        //Accommodation type picker
        accomTypePicker = UIPickerView()
        accomTypePicker.dataSource = self
        accomTypePicker.delegate = self
        accomTypePicker.backgroundColor = UIColor.groupTableViewBackgroundColor()
        accomTypePicker.showsSelectionIndicator = true
        accommodationTypeTxt.inputView = accomTypePicker
        
        //tag the pickers 
        checkinPicker.tag = 0
        minNightPicker.tag = 1
        maxNightPicker.tag = 2
        accomTypePicker.tag = 3
        
        //hide Picker view
        let hideTap = UITapGestureRecognizer(target: self, action: #selector(createListingVC.hidePicker))
        hideTap.numberOfTapsRequired = 1
        self.view.userInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
        
        
        // choose optional data: amenities and languqges
        lblChoose = [kitchenLbl, breakfastLbl, wifiInternetLbl, wheelchairAccessible, tvLbl, lockForBedroom, elevatorLbl, dryerLbl, washerLbl, ironLbl, hairDryerLbl, smokingAllowedLbl, intercomLbl, airConditioningLbl, familyKidLbl, petsAllowed, parkignLbl, indoorFireplaceLbl, gymLbl, poolLbl, saunaLbl, hammamLbl, jacuzziLbl , englishLbl, frenchLbl, spanishLbl, germanLbl, chineseLbl, italianLbl, portugueseLbl, dutchLbl, russianLbl, arabicLbl, japaneseLbl]
        
        // Tap gesture recognizer for optional data: amenities and languages
        for object in lblChoose {
            let tapLbl =  UITapGestureRecognizer(target: self, action: #selector(homeVC.tapLbl(_:)))
            tapLbl.numberOfTapsRequired = 1
            object.userInteractionEnabled = true
            object.addGestureRecognizer(tapLbl)
        }
        
        // if add maximum number of nights is tapped
        addMaxNights()

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
    @IBAction func removeMinNightBtn_clicked(sender: AnyObject) {
        nb = Int(nbMinNightsLbl.text!)!
        nbMinNightsLbl.text = String(nb-1)
        if nb == 1 {
            nbMinNightsLbl.text = String(1)
        }
    }
    
    @IBAction func addMinNightBtn_clicked(sender: AnyObject) {
        nb = Int(nbMinNightsLbl.text!)!
        nbMinNightsLbl.text = String(nb+1)
    }
    
    //Add or remove number of nights-------------------------------------------------------------------------
    @IBAction func removeMaxNightBtn_clicked(sender: AnyObject) {
        if nbMaxNightLbl.text == "30+" {
            nbMaxNightLbl.text = "2"
        }
        else {
            nb = Int(nbMaxNightLbl.text!)!
            nbMaxNightLbl.text = String(nb-1)
            if nb == 2 {
                nbMaxNightLbl.text = String(2)
            }
        }
    }
    
    @IBAction func addMaxNightBtn_clicked(sender: AnyObject) {
        if nbMaxNightLbl.text == "30+" {
            nbMaxNightLbl.text = "2"
        }
        else {
            nb = Int(nbMaxNightLbl.text!)!
            nbMaxNightLbl.text = String(nb+1)
        }
    }
    
    func addMaxNights() {
    
    }

    
    //--------------------------------------------PICKER VIEW METHODS----------------------------------------
    
    // number of components: one component the string array of hour
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        if pickerView.tag == 0 {
            return checkinData.count
        }
        else if pickerView.tag == 1 {
            return 1
        }
        else if pickerView.tag == 2 {
            return 1
        }
        else if pickerView.tag == 3 {
            return 1
        }
        
        return 0
    }
    
    //number of items to be selected
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            return checkinData[component].count
        }
        else if pickerView.tag == 1 {
            return minNightData.count
        }
        else if pickerView.tag == 2 {
            return maxNightData.count
        }
        else if pickerView.tag == 3 {
            return accomTypeData.count
        }

        
        return 0
    }
    
    //the title of items to be selected
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return checkinData[component][row]
        }
        else if pickerView.tag == 1 {
            return minNightData[row]
        }
        else if pickerView.tag == 2 {
            return maxNightData[row]
        }
        else if pickerView.tag == 3 {
            return accomTypeData[row]
        }
        
        return ""
    }
    
    //picker text config
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 0 {
            hour = checkinData[0][pickerView.selectedRowInComponent(0)]
            minute = checkinData[1][pickerView.selectedRowInComponent(1)]
            checkinTxt.text = hour + ":" + minute
            if checkinTxt.text == "any hour:any minute" {
                checkinTxt.text = "any time"
            }
    
        }
        else if pickerView.tag == 1 {
            minNightTxtPicker.text = minNightData[row]
        }
        else if pickerView.tag == 2 {
            maxNightTxtPicker.text = maxNightData[row]
        }
        else if pickerView.tag == 3 {
            accommodationTypeTxt.text = accomTypeData[row]
        }
    }
    
    func hidePicker(recognizer: UITapGestureRecognizer) {
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


    /*
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
    */

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

