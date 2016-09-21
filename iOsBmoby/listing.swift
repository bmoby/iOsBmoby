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
    var airConditioning :String = "0"
    var animalsAllowed :String = "0"
    var bathrooms :String = "0"
    var bedrooms :String = "0"
    var beds :String = "0"
    var breakfast :String = "0"
    var checkIn :String = "0"
    var city :String = "0"
    var country :String = "0"
    var elevator :String = "0"
    var entireHome :String = "0"
    var guests :String = "0"
    var gym :String = "0"
    var hairDryer :String = "0"
    var hammam :String = "0"
    var hostLanguageArabic :String = "0"
    var hostLanguageChina :String = "0"
    var hostLanguageDutch :String = "0"
    var hostLanguageEnglish :String = "0"
    var hostLanguageFrench :String = "0"
    var hostLanguageGerman :String = "0"
    var hostLanguageItalien :String = "0"
    var hostLanguageJapanese :String = "0"
    var hostLanguagePortuguese :String = "0"
    var hostLanguageRussian :String = "0"
    var hostLanguageSpanish :String = "0"
    var image01 :String = "0"
    var image02 :String = "0"
    var image03 :String = "0"
    var image04 :String = "0"
    var image05 :String = "0"
    var image06 :String = "0"
    var image07 :String = "0"
    var image08 :String = "0"
    var image09 :String = "0"
    var intercom :String = "0"
    var iron :String = "0"
    var jacuzzi :String = "0"
    var kidFamilyFriendly :String = "0"
    var kitchen :String = "0"
    var lockOnBedroomDoor :String = "0"
    var nights :String = "0"
    var parking :String = "0"
    var pool :String = "0"
    var price :String = "0"
    var privateRoom :String = "0"
    var province :String = "0"
    var sauna :String = "0"
    var sharedRoom :String = "0"
    var smokingAllowed :String = "0"
    var state :String = "0"
    var tv :String = "0"
    var uuid :String = "0"
    var washer :String = "0"
    var wheelchairAccessible :String = "0"
    var wifiInternet :String = "0"
    var zipPostal :String = "0"
    
    
    func save(){
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
        object["image01"] = image01
        object["image02"] = image02
        object["image03"] = image03
        object["image04"] = image04
        object["image05"] = image05
        object["image06"] = image06
        object["image07"] = image07
        object["image08"] = image08
        object["image09"] = image09
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
                print(error!.localizedDescription)
            }
        }
        
    }
}
