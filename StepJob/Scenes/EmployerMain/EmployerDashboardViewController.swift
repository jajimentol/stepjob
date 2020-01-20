//
//  EmployerDashboardViewController.swift
//  StepJob
//
//  Created by Sirius on 31.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit
import ObjectMapper

class EmployerDashboardViewController: StandardViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var jobs: [Job]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInterface()
    }
    
    func setInterface() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 190
        tableView.register(UINib(nibName: "DashboardHeaderTVC", bundle: nil), forCellReuseIdentifier: "DashboardHeaderTVC")
        tableView.register(UINib(nibName: "EmployerDashboardTVC", bundle: nil), forCellReuseIdentifier: "EmployerDashboardTVC")
        tableView.register(UINib(nibName: "ProfileHeaderTVC", bundle: nil), forCellReuseIdentifier: "ProfileHeaderTVC")
        
        getJobs()
    }
    
    func setTargets() {
    }
    
    func getJobs() {
        
        WebService().employerJobs(status: "ACTIVE") { (response, error) in
            if !error {
                if let jobs = Mapper<Jobs>().map(JSON: response) {
                    self.jobs = jobs.jobs
                }
            }
        }
    }
}

extension EmployerDashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return jobs?.count ?? 0
        } else { return 0 }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderTVC", for: indexPath) as! ProfileHeaderTVC
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmployerDashboardTVC", for: indexPath) as! EmployerDashboardTVC
            if jobs != nil && (jobs?.count ?? 0 > indexPath.row) {
                cell.fillAd(with: (jobs?[indexPath.row])!)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Employer", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EmployerJobDetailViewController") as! EmployerJobDetailViewController
        vc.jobId = jobs?[indexPath.row].id
        navigationController?.pushViewController(vc, animated: true)
    }
}
