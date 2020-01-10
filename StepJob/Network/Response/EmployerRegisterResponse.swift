//
//  EmployerRegisterResponse.swift
//  StepJob
//
//  Created by Sirius on 13.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import ObjectMapper

class EmployerRegisterResponse: Mappable {
    
    var id: Int?
    var email: String?
    var enabled: Bool?
    var organizationName: String?
    var activityArea: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id    <- map["id"]
        email    <- map["email"]
        enabled    <- map["enabled"]
        organizationName    <- map["organizationName"]
        activityArea    <- map["activityArea"]
    }
    
    
}
