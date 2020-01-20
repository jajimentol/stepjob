//
//  JobDetailViewController.swift
//  StepJob
//
//  Created by Sirius on 23.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class JobDetailViewController: UIViewController {
    @IBOutlet weak var submitButton: UIButton!
    
    var isEmployer: Bool = false
    var jobData: Job?
    
    @IBOutlet weak var jobNameLabel: UILabel!
    @IBOutlet weak var organizationNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var applyLabel: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "İlan Detayı"
        submitButton.layer.cornerRadius = 8.0
        setInterface()
    }
    
    func setInterface() {
        if isEmployer {
            editButton.layer.cornerRadius = 22.0
            submitButton.isHidden = true
            editButton.isHidden = false
        } else {
            editButton.isHidden = true
            submitButton.isHidden = false
        }
        
        fillScene()
        
    }
    
    func fillScene() {
        title = jobData?.title
        jobNameLabel.text = jobData?.title
        organizationNameLabel.text = jobData?.employer?.organizationName
        locationLabel.text = jobData?.location
        priceLabel.text = jobData?.price
        typeLabel.text = jobData?.jobType
        timeLabel.text = jobData?.creationDate
        applyLabel.text = String(jobData?.workerCount ?? "0") + " Başvuru"
        descriptionLabel.text = jobData?.description
        
    }
    @IBAction func submitTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
