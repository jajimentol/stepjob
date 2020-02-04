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
        
        tableView.register(UINib(nibName: "MoreTVC", bundle: nil), forCellReuseIdentifier: "MoreTVC")
        
    }
    
}

extension MoreViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTVC", for: indexPath) as! MoreTVC
        cell.fillCell(row: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
