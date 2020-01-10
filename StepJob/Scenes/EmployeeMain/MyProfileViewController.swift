//
//  MyProfileViewController.swift
//  StepJob
//
//  Created by Sirius on 23.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    
    var isEmployer: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(!isEmployer, animated: true)
        
    }
    
    func setInterface() {
        editButton.layer.cornerRadius = 25.0
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DashboardJobTVC", bundle: nil), forCellReuseIdentifier: "DashboardJobTVC")
        
        if isEmployer {
            setupForEmployer()
        } else {
            messageButton.isHidden = true
            confirmButton.isHidden = true
            callButton.isHidden = true
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardJobTVC", for: indexPath) as! DashboardJobTVC
        cell.fillCell(job: "Yazılım Geliştirme Elemanı", company: "ROTA İNTERNET TEKNOLOJİ HİZMETLERİ", location: "İstanbul(Asya)", price: "100₺")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Önceki İşler"
    }
    
}
