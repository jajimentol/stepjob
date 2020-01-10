//
//  EmployerLoginRequest.swift
//  StepJob
//
//  Created by Sirius on 13.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import Foundation

class EmployerLoginRequest: NSObject {
    
    var parameters: [String:AnyObject] = [:]
    
    func makeParameter(email:String, password: String) -> [String:AnyObject] {
        self.parameters["email"] = email as AnyObject
        self.parameters["password"] = password as AnyObject
        return parameters
    }
    
}
