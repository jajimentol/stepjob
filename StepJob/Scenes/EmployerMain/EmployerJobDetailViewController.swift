//
//  EmployerJobDetailViewController.swift
//  StepJob
//
//  Created by Sirius on 5.11.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit
import ObjectMapper

struct ActiveTabs {
    static let applies = 0
    static let accepted = 1
    static let detail = 2
}

class EmployerJobDetailViewController: StandardViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var jobId: Int?
    var jobData: Job? {
        didSet {
            title = jobData?.title
            tableView.reloadData()
        }
    }
    
    var activeTab: Int = ActiveTabs.applies {
        didSet {
            print(activeTab)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJobDetail()
        setInterface()
    }
    
    func setInterface() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SingleEmployeeTVC", bundle: nil), forCellReuseIdentifier: "SingleEmployeeTVC")
        tableView.separatorStyle = .none
    }
    
    func getJobDetail() {
        WebService().getJobDetail(jobId: jobId ?? 0) { (response, error) in
            if let job = Mapper<Job>().map(JSON: response), !error {
                self.jobData = job
            }
        }
    }
    
    func setTargets() {
        
    }
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func openJobDetail() {
        let vc = JobDetailViewController(nibName: "JobDetailViewController", bundle: nil)
        vc.jobData = self.jobData
        vc.isEmployer = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func reloadTableView(_ sender: UIButton) {
        activeTab = sender.tag
        tableView.reloadData()
    }
    
    func getWorker(workerId: Int) {
        
        WebService().workerProfile(jobId: jobId ?? 0, workerId: workerId) { (response, error) in
            if !error {
                
            }
        }
        
    }
}

extension EmployerJobDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.activeTab {
        case ActiveTabs.applies:
            return jobData?.waitingJobApplies?.count ?? 0
        case ActiveTabs.accepted:
            return jobData?.approvedJobApplies?.count ?? 0
        case ActiveTabs.detail:
            return 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch self.activeTab {
        case ActiveTabs.applies:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SingleEmployeeTVC", for: indexPath) as? SingleEmployeeTVC {
                cell.fillCell(with: (jobData?.waitingJobApplies?[indexPath.row])!)
                return cell
            }
        case ActiveTabs.accepted:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SingleEmployeeTVC", for: indexPath) as? SingleEmployeeTVC {
                cell.fillCell(with: (jobData?.approvedJobApplies?[indexPath.row])!)
                return cell
            }
        case ActiveTabs.detail:
            break
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SingleEmployeeTVC", for: indexPath) as? SingleEmployeeTVC {
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch self.activeTab {
        case ActiveTabs.applies, ActiveTabs.accepted:
            let vc = MyProfileViewController(nibName: "MyProfileViewController", bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.isUserInteractionEnabled = true
        header.backgroundColor = UIColorFromRGB(0x313247)
        
        let leftButton = UIButton()
        leftButton.setTitleColor(.white, for: .normal)
        leftButton.setTitle("Başvurular", for: .normal)
        leftButton.setTitleColor(UIColorFromRGB(0xDF6265), for: .selected)
        leftButton.tag = ActiveTabs.applies
        leftButton.addTarget(self, action: #selector(reloadTableView), for: .touchUpInside)
        header.addSubview(leftButton)
        leftButton.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(header)
            make.width.equalTo(view.frame.width/3)
        }
        
        let rightButton = UIButton()
        rightButton.setTitleColor(.white, for: .normal)
        rightButton.setTitle("İlan Detayı", for: .normal)
        rightButton.addTarget(self, action: #selector(openJobDetail), for: .touchUpInside)
        rightButton.setTitleColor(UIColorFromRGB(0xDF6265), for: .selected)
        rightButton.tag = ActiveTabs.detail
        header.addSubview(rightButton)
        rightButton.snp.makeConstraints { (make) in
            make.right.top.bottom.equalTo(header)
            make.width.equalTo(leftButton)
        }
        
        let middleButton = UIButton()
        middleButton.setTitleColor(.white, for: .normal)
        middleButton.setTitle("Onaylananlar", for: .normal)
        middleButton.addTarget(self, action: #selector(reloadTableView), for: .touchUpInside)
        middleButton.setTitleColor(UIColorFromRGB(0xDF6265), for: .selected)
        middleButton.tag = ActiveTabs.accepted
        header.addSubview(middleButton)
        middleButton.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(header)
            make.left.equalTo(leftButton.snp.right)
            make.right.equalTo(rightButton.snp.left)
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
