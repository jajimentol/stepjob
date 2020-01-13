//
//  WorkerRegisterRequest.swift
//  StepJob
//
//  Created by Sirius on 13.01.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import Foundation

class WorkerRegisterRequest: NSObject {
    
    var parameters: [String:AnyObject] = [:]
    
    func makeParameter(email:String, fullName: String, password: String, genderId: Int) -> [String:AnyObject] {
        self.parameters["fullName"] = fullName as AnyObject
        self.parameters["email"] = email as AnyObject
        self.parameters["genderId"] = genderId as AnyObject
        self.parameters["password"] = password as AnyObject
        return parameters
    }
    
}
