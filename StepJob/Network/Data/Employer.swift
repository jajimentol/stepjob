//
//  Employer.swift
//  StepJob
//
//  Created by Sirius on 19.01.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import Foundation
import ObjectMapper

class Employer: Mappable {
    
    var email: String?
    var priceFree: Bool?
    var organizationName: String?
    var activeJobCount: Int?
    var passiveJobCount: Int?
    var registerDate: String?
    var enabled: Bool?
    var id: Int?
    var jobCount: Int?
    var profilePicture: String?
    var rating: Double?
    var activityArea: ActivityArea?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        enabled    <- map["enabled"]
        jobCount    <- map["jobCount"]
        id    <- map["id"]
        profilePicture    <- map["profilePicture"]
        rating    <- map["rating"]
        email    <- map["email"]
        priceFree    <- map["priceFree"]
        organizationName    <- map["organizationName"]
        activeJobCount    <- map["activeJobCount"]
        passiveJobCount    <- map["passiveJobCount"]
        registerDate    <- map["registerDate"]
        activityArea    <- map["activityArea"]
    }
    
}


