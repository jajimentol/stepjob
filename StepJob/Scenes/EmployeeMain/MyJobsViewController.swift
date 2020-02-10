//
//  MyJobsViewController.swift
//  StepJob
//
//  Created by Sirius on 10.02.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import UIKit
import ObjectMapper

class MyJobsViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var appliedJobs: [Job]? {
        didSet {
            setInterface()
        }
    }
    var waitingJobs: [Job]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getJobs()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func getJobs() {
        
        WebService().getJobsByStatus(status: "APPROVED") { [weak self] (response, error) in
            guard let strongSelf = self else { return }
            if !error, let appliedJobs = Mapper<Jobs>().map(JSON: response) {
                strongSelf.appliedJobs = appliedJobs.jobs
            }
        }
 
        WebService().getJobsByStatus(status: "WAITING") { [weak self] (response, error) in
            guard let strongSelf = self else { return }
            if !error, let waitingJobs = Mapper<Jobs>().map(JSON: response) {
                strongSelf.waitingJobs = waitingJobs.jobs
            }
        }
    }
    
    func setInterface() {
        
    }
    
    @IBAction func controlValueChanged(_ sender: UISegmentedControl) {
        collectionView.reloadData()
    }
}

extension MyJobsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return appliedJobs?.count ?? 0
        } else if segmentedControl.selectedSegmentIndex == 1 {
            return waitingJobs?.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
    
    
    
    
}
