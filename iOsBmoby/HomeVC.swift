//
//  HomeVC.swift
//  iOsBmoby
//
//  Created by Oulachyov  on 9/21/16.
//  Copyright © 2016 BMoby. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var bmobyImg: UIImageView!
    
    @IBOutlet weak var priceIcon: UILabel!
    @IBOutlet weak var priceSliderLbl: UILabel!
    @IBOutlet weak var priceSlider: UISlider!
    
    @IBOutlet weak var guestIconLbl: UILabel!
    @IBOutlet weak var nbGuestLbl: UILabel!
    @IBOutlet weak var guestLbl: UILabel!
    @IBOutlet weak var addGuestBtn: UIButton!
    @IBOutlet weak var removeGuestBtn: UIButton!
    
    @IBOutlet weak var nightIconLbl: UILabel!
    @IBOutlet weak var nbNightLbl: UILabel!
    @IBOutlet weak var nightLbl: UILabel!
    
    
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
