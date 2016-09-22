//
//  citiesHeader.swift
//  iOsBmoby
//
//  Created by Magomed Souleymnov on 21/09/2016.
//  Copyright © 2016 BMoby. All rights reserved.
//

import UIKit

class citiesHeader: UICollectionReusableView {
    @IBAction func chooseCityBtnClicked(sender: AnyObject) {
        currentCity = citiesHeaderTxtField.text
        print(currentCity)
    }
    
    // THIS IS THE PROTOTYPE OF THE HEADER USED IN CitiesVC
    @IBOutlet weak var citiesHeaderSubmitBtn: UIButton!
    @IBOutlet weak var citiesHeaderTitleLbl: UILabel!
    @IBOutlet weak var citiesHeaderTxtField: UITextField!
}
