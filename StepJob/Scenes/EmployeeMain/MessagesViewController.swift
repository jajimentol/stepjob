//
//  MessagesViewController.swift
//  StepJob
//
//  Created by Sirius on 1.12.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class MessagesViewController: StandardViewController {
    
    var tableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        
        setInterface()
    }
    
    func setInterface() {
        setupTableView()
    }
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "SearchHeaderTVC", bundle: nil), forCellReuseIdentifier: "SearchHeaderTVC")
        tableView.register(UINib(nibName: "SingleEmployeeTVC", bundle: nil), forCellReuseIdentifier: "SingleEmployeeTVC")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(view)
        }
        
    }
    
    func setTargets() {
    }
    
}

extension MessagesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 12
        } else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchHeaderTVC", for: indexPath) as! SearchHeaderTVC
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleEmployeeTVC", for: indexPath) as! SingleEmployeeTVC
            cell.setupForMessageCell()
            return cell
        } else { return UITableViewCell() }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MessageDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
