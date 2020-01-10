//
//  EmployerData.swift
//  StepJob
//
//  Created by Sirius on 13.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import Foundation
import ObjectMapper

class EmployerData: Mappable {
    
    var id: Int?
    var email: String?
    var enabled: Bool?
    var organizationName: String?
    var activityArea: String?
    var about: String?
    var twitterUrl: String?
    var instagramUrl: String?
    var facebookUrl: String?
    var webSite: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id    <- map["id"]
        email    <- map["email"]
        enabled    <- map["enabled"]
        organizationName    <- map["organizationName"]
        activityArea    <- map["activityArea"]
        about    <- map["about"]
        twitterUrl    <- map["twitterUrl"]
        instagramUrl    <- map["instagramUrl"]
        facebookUrl    <- map["facebookUrl"]
        webSite    <- map["webSite"]
    }
}
