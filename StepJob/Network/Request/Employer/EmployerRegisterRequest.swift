//
//  EmployerRegisterRequest.swift
//  StepJob
//
//  Created by Sirius on 13.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import Foundation

class EmployerRegisterRequest: NSObject {
    
    var parameters: [String:AnyObject] = [:]
    
    func makeParameter(area:String, email:String, organization: String, password: String) -> [String:AnyObject] {
        self.parameters["activityArea"] = area as AnyObject
        self.parameters["email"] = email as AnyObject
        self.parameters["organizationName"] = organization as AnyObject
        self.parameters["password"] = password as AnyObject
        return parameters
    }
    
}
