//
//  UserData.swift
//  StepJob
//
//  Created by Sirius on 10.01.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import Foundation

var isUserEmployer: Bool?

var userToken: String? {
    willSet{
        UserDefaults.standard.set(newValue, forKey: "sj-token")
    }
}

var employerUser: Employer?

var workerUser: Worker?
