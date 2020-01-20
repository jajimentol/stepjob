//
//  EmployerJobDetailViewController.swift
//  StepJob
//
//  Created by Sirius on 5.11.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class EmployerJobDetailViewController: StandardViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInterface()
    }
    
    func setInterface() {
        title = "İlan Detayı"
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SingleEmployeeTVC", bundle: nil), forCellReuseIdentifier: "SingleEmployeeTVC")
        tableView.separatorStyle = .none
    }
    
    func setTargets() {
        
    }
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func openJobDetail() {
        let vc = JobDetailViewController(nibName: "JobDetailViewController", bundle: nil)
        vc.isEmployer = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension EmployerJobDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SingleEmployeeTVC", for: indexPath) as? SingleEmployeeTVC {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MyProfileViewController(nibName: "MyProfileViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.isUserInteractionEnabled = true
        header.backgroundColor = UIColorFromRGB(0x313247)
        
        let leftButton = UIButton()
        leftButton.setTitleColor(.white, for: .normal)
        leftButton.setTitle("Başvurular", for: .normal)
        leftButton.setTitleColor(UIColorFromRGB(0xDF6265), for: .selected)
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
        header.addSubview(rightButton)
        rightButton.snp.makeConstraints { (make) in
            make.right.top.bottom.equalTo(header)
            make.width.equalTo(leftButton)
        }
        
        let middleButton = UIButton()
        middleButton.setTitleColor(.white, for: .normal)
        middleButton.setTitle("Onaylananlar", for: .normal)
        middleButton.setTitleColor(UIColorFromRGB(0xDF6265), for: .selected)
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
