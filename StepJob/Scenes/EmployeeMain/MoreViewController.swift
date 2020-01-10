//
//  MoreViewController.swift
//  StepJob
//
//  Created by Sirius on 9.01.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import UIKit

class MoreViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInterface()
    }
    
    func setInterface() {
        
        
        
    }
    
}

extension MoreViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Şifreni Yenile"
        case 1:
            cell.textLabel?.text = "Bildirimler"
        case 2:
            cell.textLabel?.text = "Yardım"
        case 3:
            cell.textLabel?.text = "Hakkında"
        case 4:
            cell.textLabel?.text = "Çıkış Yap"
        default:
            cell.textLabel?.text = "Default Case"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
}
