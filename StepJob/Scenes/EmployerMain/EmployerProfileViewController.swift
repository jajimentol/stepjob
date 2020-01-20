//
//  EmployerProfileViewController.swift
//  StepJob
//
//  Created by Sirius on 20.01.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import UIKit
import ObjectMapper

class EmployerProfileViewController: StandardViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var employerData: Employer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInterface()
    }
    
    func setInterface() {
        tableView.register(UINib(nibName: "EmployerProfileTVC", bundle: nil), forCellReuseIdentifier: "EmployerProfileTVC")
        tableView.register(UINib(nibName: "DashboardJobTVC", bundle: nil), forCellReuseIdentifier: "DashboardJobTVC")
        tableView.delegate = self
        tableView.dataSource = self
        
        getMe()
    }
    
    func setTargets() {
    }
    
    func getMe() {
        
        WebService().employerMe { (response, error) in
            if let employer = Mapper<Employer>().map(JSON: response), !error {
                self.employerData = employer
                self.tableView.reloadData()
            }
        }
        
    }
}

extension EmployerProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmployerProfileTVC", for: indexPath) as! EmployerProfileTVC
            if let employer = employerData { cell.fillEmployer(with: employer) }
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardJobTVC", for: indexPath) as! DashboardJobTVC
            cell.fillCell(job: "Kasiyer", company: "Defacto", location: "İstanbul(Asya)", price: "100₺")
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
