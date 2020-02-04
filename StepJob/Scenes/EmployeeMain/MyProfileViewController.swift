//
//  MyProfileViewController.swift
//  StepJob
//
//  Created by Sirius on 23.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit
import ObjectMapper

class MyProfileViewController: UIViewController {

    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobCountLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var genderAgeLabel: UILabel!
    
    var oldJobs: [Job]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setInterface() {
        editButton.layer.cornerRadius = 25.0
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DashboardJobTVC", bundle: nil), forCellReuseIdentifier: "DashboardJobTVC")
        
        messageButton.isHidden = true
        confirmButton.isHidden = true
        callButton.isHidden = true
        
        nameLabel.text = workerUser?.fullName
        jobCountLabel.text = String(workerUser?.jobs?.count ?? 0)
        ratingLabel.text = String(Double(workerUser?.rating ?? 5))
        locationLabel.text = workerUser?.location
        genderAgeLabel.text = (workerUser?.gender ?? "Belirtilmemiş") + ", " + String(workerUser?.age ?? 0)
        bioLabel.text = workerUser?.about
        
    }
    
    func getUser() {
        
        WebService().workerMe { [weak self] (response, error) in
            guard let strongSelf = self else { return }
            if !error, let worker = Mapper<Worker>().map(JSONObject: response) {
                workerUser = worker
                strongSelf.setInterface()
                strongSelf.oldJobs = worker.jobs
            }
        }
    }
    
    func setupForEmployer() {
        editButton.isHidden = true
        
        messageButton.layer.cornerRadius = 25.0
        confirmButton.layer.cornerRadius = 25.0
        callButton.layer.cornerRadius = 25.0
    }
    
}

extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oldJobs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardJobTVC", for: indexPath) as! DashboardJobTVC
        if let job = oldJobs?[indexPath.row] {
            cell.fillCell(with: job)
        } else {
            cell.fillCell(job: "Yazılım Geliştirme Elemanı", company: "ROTA İNTERNET TEKNOLOJİ HİZMETLERİ", location: "İstanbul(Asya)", price: "100₺")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Önceki İşler"
    }
    
}
