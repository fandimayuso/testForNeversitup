//
//  SettingsTableViewController.swift
//  Piggipo2
//
//  Created by Muhammat Fandi Mayuso on 27/4/19.
//  Copyright © 2019 Muhammat Fandi Mayuso. All rights reserved.
//

import UIKit

class SettingsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var settingLabel: UILabel!
    
}

class SettingsTableViewController: UITableViewController {
    @IBOutlet var settingTableView: UITableView!
    
    var imageMenu1 = ["otp", "passcode"]
    var imageMenu2 = ["theme", "language"]
    var imageMenu3 = ["sound"]
    
    var settingMenu1 = ["OTP", "Passcode"]
    var settingMenu2 = ["Theme", "Language"]
    var settingMenu3 = ["Sound"]

    var isSoundOn : Bool = false
    var isOTPOn : Bool = false
    var isPasscodeOn : Bool = false

    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "isSoundOn") == true {
            settingMenu3 = ["Sound", "Dashboard", "Add transaction", "Payment", "Passcode"]
            imageMenu3 = ["sound", "", "", "", ""]
        }
        else {
            settingMenu3 = ["Sound"]
            imageMenu3 = ["sound"]
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return settingMenu1.count
        }
        else if section == 1 {
            return settingMenu2.count
        }
        else {
            return settingMenu3.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingsTableViewCell
        
        var imageMenu = [String]()
        var settingMenu = [String]()
        
        if indexPath.section == 0 {
            imageMenu = imageMenu1
            settingMenu = settingMenu1

            let switchView = UISwitch(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            
            if indexPath.row == 0 {
                switchView.isOn = UserDefaults.standard.bool(forKey: "isOTPOn")
            }
            else {
                switchView.isOn = UserDefaults.standard.bool(forKey: "isPasscodeOn")
            }
            
            switchView.tag = indexPath.row + 100
            switchView.addTarget(self, action: #selector(switchTriggered), for: .valueChanged)
            cell.accessoryView = switchView

        }
        else if indexPath.section == 1 {
            imageMenu = imageMenu2
            settingMenu = settingMenu2
            
            if indexPath.row == 0 {
                
            }
            
            if indexPath.row == 1 {
                let items = ["Eng", "ไทย"]
                let customSC = UISegmentedControl(items: items)
                customSC.tag = indexPath.row + 300
                customSC.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "languageSelectedIndex")
                
                customSC.frame = CGRect(x:0, y: 0,
                                        width: 100, height: 30)
                
                customSC.backgroundColor = .white
                customSC.tintColor = UIColor(red:0.21, green:0.47, blue:0.96, alpha:1.0)
                customSC.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
                cell.accessoryView = customSC
            }
        }
        else {
            imageMenu = imageMenu3
            settingMenu = settingMenu3

            let switchView = UISwitch(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            switchView.isOn = UserDefaults.standard.bool(forKey: "isSoundOn")
            switchView.tag = indexPath.row + 200
            switchView.addTarget(self, action: #selector(switchTriggered), for: .valueChanged)
            cell.accessoryView = switchView

        }
        
        

        cell.settingLabel.text = settingMenu[indexPath.row]
        cell.settingImageView.image = UIImage(named: imageMenu[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 1.0))
        headerView.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 1
        }
        return 10
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 1.0))
        footerView.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return 1
        }
        return 10
    }
    
    @objc func switchTriggered(sender: UISwitch) {
        
        if sender.tag == 100 {
            if UserDefaults.standard.bool(forKey: "isOTPOn") == true {
                isOTPOn = false
                UserDefaults.standard.set(isOTPOn, forKey: "isOTPOn")
                
            }
            else {
                isOTPOn = true
                UserDefaults.standard.set(isOTPOn, forKey: "isOTPOn")
                
            }
        }
        
        if sender.tag == 101 {
            if UserDefaults.standard.bool(forKey: "isPasscodeOn") == true {
                isPasscodeOn = false
                UserDefaults.standard.set(isPasscodeOn, forKey: "isPasscodeOn")
                
            }
            else {
                isPasscodeOn = true
                UserDefaults.standard.set(isPasscodeOn, forKey: "isPasscodeOn")
                
            }
        }
        
        if sender.tag == 200 {
            if UserDefaults.standard.bool(forKey: "isSoundOn") == true {
                isSoundOn = false
                UserDefaults.standard.set(isSoundOn, forKey: "isSoundOn")
                settingMenu3 = ["Sound"]
                imageMenu3 = ["sound"]
                
            }
            else {
                isSoundOn = true
                UserDefaults.standard.set(isSoundOn, forKey: "isSoundOn")
                settingMenu3 = ["Sound", "Dashboard", "Add transaction", "Payment", "Passcode"]
                imageMenu3 = ["sound", "", "", "", ""]
                
            }
            
            let sectionToReload = 2
            let indexSet: IndexSet = [sectionToReload]
            settingTableView.reloadSections(indexSet, with: .automatic)
            
        }
        
    }
    
    @objc func segmentedControlChanged(sender: UISegmentedControl) {
        
        if UserDefaults.standard.integer(forKey: "languageSelectedIndex") == 0 {
            UserDefaults.standard.set(1, forKey: "languageSelectedIndex")
            
        }
        else {
            UserDefaults.standard.set(0, forKey: "languageSelectedIndex")
            
        }
        
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
