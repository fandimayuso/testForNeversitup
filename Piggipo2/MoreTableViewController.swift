//
//  MoreTableViewController.swift
//  Piggipo2
//
//  Created by Muhammat Fandi Mayuso on 27/4/19.
//  Copyright © 2019 Muhammat Fandi Mayuso. All rights reserved.
//

import UIKit

class MoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    
    
}

class MoreTableViewController: UITableViewController {
    
    let menu1 = ["Login", "History", "Export"]
    let menu2 = ["Bank Call Center", "Report Problem"]
    let menu3 = ["Settings", "In App Purchase", "Promo Code"]
    let menu4 = ["Help and Support", "Privacy", "Logout"]
    
    let image1 = ["login", "history", "excel"]
    let image2 = ["phone", "report"]
    let image3 = ["setting", "cart", "gift"]
    let image4 = ["question", "privacy", "logout"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return menu1.count
        }
        else if section == 1 {
            return menu2.count
        }
        else if section == 2 {
            return menu3.count
        }
        else {
            return menu4.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoreTableViewCell
        
        var menu = [String]()
        var image = [String]()

        if indexPath.section == 0 {
            menu = menu1
            image = image1
        }
        else if indexPath.section == 1 {
            menu = menu2
            image = image2
        }
        else if indexPath.section == 2 {
            menu = menu3
            image = image3
        }
        else {
            menu = menu4
            image = image4
        }
        
        cell.menuImageView.image = UIImage(named: image[indexPath.row])
        cell.menuLabel.text = menu[indexPath.row]

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print(menu1[indexPath.row])
        }
        else if indexPath.section == 1 {
            print(menu2[indexPath.row])
        }
        else if indexPath.section == 2 {
            print(menu3[indexPath.row])
            performSegue(withIdentifier: menu3[indexPath.row], sender: nil)
        }
        else {
            print(menu4[indexPath.row])
        }
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
        
        if section == 3 {
            let label = UILabel(frame: CGRect(x: 0, y: 8.0, width: footerView.bounds.size.width - 16.0, height: 15))
            label.text = "v.4.6.21 (Build 2)"
            label.textAlignment = .right
            label.font = label.font.withSize(13)
            label.textColor = .lightGray
            footerView.addSubview(label)
        }

        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 3 {
            return 80
        }
        return 10
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
