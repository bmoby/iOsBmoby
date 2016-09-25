//
//  loginVC.swift
//  iOsBmoby
//
//  Created by Magomed Souleymnov on 25/09/2016.
//  Copyright © 2016 BMoby. All rights reserved.
//

import UIKit

class loginVC: UIViewController {
    
    // title & textfields
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var loginEmailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    // bouttons
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
