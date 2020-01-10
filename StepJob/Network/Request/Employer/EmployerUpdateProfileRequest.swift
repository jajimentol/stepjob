//
//  EmployerUpdateProfileRequest.swift
//  StepJob
//
//  Created by Sirius on 13.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import Foundation

class EmployerUpdateProfileRequest: NSObject {
    
    var parameters: [String:AnyObject] = [:]
    
    func makeParameter(about: String,
                       activityArea: String,
                       facebookUrl: String,
                       instagramUrl: String,
                       organizationName: String,
                       twitterUrl: String,
                       website: String) -> [String:AnyObject] {
        self.parameters["about"] = about as AnyObject
        self.parameters["activityArea"] = activityArea as AnyObject
        self.parameters["facebookUrl"] = facebookUrl as AnyObject
        self.parameters["instagramUrl"] = instagramUrl as AnyObject
        self.parameters["organizationName"] = organizationName as AnyObject
        self.parameters["twitterUrl"] = twitterUrl as AnyObject
        self.parameters["website"] = website as AnyObject
        return parameters
    }   
}
