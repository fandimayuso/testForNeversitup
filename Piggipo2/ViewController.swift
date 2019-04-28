//
//  ViewController.swift
//  Piggipo2
//
//  Created by Muhammat Fandi Mayuso on 27/4/19.
//  Copyright © 2019 Muhammat Fandi Mayuso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(false, forKey: "isSoundOn")
        
        UserDefaults.standard.set(false, forKey: "isOTPOn")
        UserDefaults.standard.set(false, forKey: "isPasscodeOn")
        
        UserDefaults.standard.set(0, forKey: "languageSelectedIndex")
    }


}

