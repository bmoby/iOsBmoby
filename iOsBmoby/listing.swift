//
//  listing.swift
//  iOsBmoby
//
//  Created by Magomed Souleymnov on 20/09/2016.
//  Copyright © 2016 BMoby. All rights reserved.
//

import Foundation
import Parse

class listing{
    var longitude :String = "0"
    var latitude :String = "0"
    var streetNb :String = "0"
    var streetName :String = "0"
    var airConditioning :Bool = false
    var animalsAllowed :Bool = false
    var bathrooms :String = "0"
    var bedrooms :String = "0"
    var beds :String = "0"
    var breakfast :Bool = false
    var checkIn :String = "0"
    var city :String = "0"
    var country :String = "0"
    var elevator :Bool = false
    var entireHome :Bool = false
    var guests :String = "0"
    var gym :Bool = false
    var hairDryer :Bool = false
    var hammam :Bool = false
    var hostLanguageArabic :Bool = false
    var hostLanguageChina :Bool = false
    var hostLanguageDutch :Bool = false
    var hostLanguageEnglish :Bool = false
    var hostLanguageFrench :Bool = false
    var hostLanguageGerman :Bool = false
    var hostLanguageItalien :Bool = false
    var hostLanguageJapanese :Bool = false
    var hostLanguagePortuguese :Bool = false
    var hostLanguageRussian :Bool = false
    var hostLanguageSpanish :Bool = false
    var image01 : UIImageView!
    var image02 : UIImageView!
    var image03 : UIImageView!
    var image04 : UIImageView!
    var image05 : UIImageView!
    var image06 : UIImageView!
    var image07 : UIImageView!
    var image08 : UIImageView!
    var image09 : UIImageView!
    var intercom :Bool = false
    var iron :Bool = false
    var jacuzzi :Bool = false
    var kidFamilyFriendly :Bool = false
    var kitchen :Bool = false
    var lockOnBedroomDoor :Bool = false
    var nights :String = "0"
    var parking :Bool = false
    var pool :Bool = false
    var price :String = "0"
    var privateRoom :Bool = false
    var province :String = "0"
    var sauna :Bool = false
    var sharedRoom :Bool = false
    var smokingAllowed :Bool = false
    var state :String = "0"
    var tv :Bool = false
    var uuid :String = "0"
    var washer :Bool = false
    var wheelchairAccessible :Bool = false
    var wifiInternet :Bool = false
    var zipPostal :String = "0"
    
    
    func save(){
        //declaring images data from images UIImageView
        let image01Data = UIImageJPEGRepresentation(image01.image!, 0.5)
        let image02Data = UIImageJPEGRepresentation(image02.image!, 0.5)
        let image03Data = UIImageJPEGRepresentation(image03.image!, 0.5)
        let image04Data = UIImageJPEGRepresentation(image04.image!, 0.5)
        let image05Data = UIImageJPEGRepresentation(image05.image!, 0.5)
        let image06Data = UIImageJPEGRepresentation(image06.image!, 0.5)
        let image07Data = UIImageJPEGRepresentation(image07.image!, 0.5)
        let image08Data = UIImageJPEGRepresentation(image08.image!, 0.5)
        let image09Data = UIImageJPEGRepresentation(image09.image!, 0.5)
        
        //converting images to PFFile to send thous images to the DB
        let image01asFile = PFFile(name: "default", data: image01Data!)
        let image02asFile = PFFile(name: "default", data: image02Data!)
        let image03asFile = PFFile(name: "default", data: image03Data!)
        let image04asFile = PFFile(name: "default", data: image04Data!)
        let image05asFile = PFFile(name: "default", data: image05Data!)
        let image06asFile = PFFile(name: "default", data: image06Data!)
        let image07asFile = PFFile(name: "default", data: image07Data!)
        let image08asFile = PFFile(name: "default", data: image08Data!)
        let image09asFile = PFFile(name: "default", data: image09Data!)
        
        
        let object = PFObject(className: "listings")
        object["longitude"] =  longitude
        object["latitude"] = latitude
        object["streetNb"] = streetNb
        object["streetName"] = streetName
        object["airConditioning"] = airConditioning
        object["animalsAllowed"] = animalsAllowed
        object["bathrooms"] = bathrooms
        object["bedrooms"] = bedrooms
        object["beds"] = beds
        object["breakfast"] = breakfast
        object["checkIn"] = checkIn
        object["city"] = city
        object["country"] = country
        object["elevator"] = elevator
        object["entireHome"] = entireHome
        object["guests"] = guests
        object["gym"] = gym
        object["hairDryer"] = hairDryer
        object["hammam"] = hammam
        object["hostLanguageArabic"] = hostLanguageArabic
        object["hostLanguageChina"] = hostLanguageChina
        object["hostLanguageDutch"] = hostLanguageDutch
        object["hostLanguageEnglish"] = hostLanguageEnglish
        object["hostLanguageFrench"] = hostLanguageFrench
        object["hostLanguageGerman"] = hostLanguageGerman
        object["hostLanguageItalien"] = hostLanguageItalien
        object["hostLanguageJapanese"] = hostLanguageJapanese
        object["hostLanguagePortuguese"] = hostLanguagePortuguese
        object["hostLanguageRussian"] = hostLanguageRussian
        object["hostLanguageSpanish"] = hostLanguageSpanish
        object["image01"] = image01asFile
        object["image02"] = image02asFile
        object["image03"] = image03asFile
        object["image04"] = image04asFile
        object["image05"] = image05asFile
        object["image06"] = image06asFile
        object["image07"] = image07asFile
        object["image08"] = image08asFile
        object["image09"] = image09asFile
        object["intercom"] = intercom
        object["iron"] = iron
        object["jacuzzi"] = jacuzzi
        object["kidFamilyFriendly"] = kidFamilyFriendly
        object["kitchen"] = kitchen
        object["lockOnBedroomDoor"] = lockOnBedroomDoor
        object["nights"] = nights
        object["parking"] = parking
        object["pool"] = pool
        object["price"] = price
        object["privateRoom"] = privateRoom
        object["province"] = province
        object["sauna"] = sauna
        object["sharedRoom"] = sharedRoom
        object["smokingAllowed"] = smokingAllowed
        object["state"] = state
        object["tv"] = tv
        object["uuid"] = uuid
        object["washer"] = washer
        object["wheelchairAccessible"] = wheelchairAccessible
        object["wifiInternet"] = wifiInternet
        object["zipPostal"] = zipPostal

        object.saveInBackgroundWithBlock { (success: Bool, error: NSError?) in
            if success {
                print("listing was saved in DB with success")
            } else {
                print(error?.localizedDescription)
            }
        }
        
    }
}
