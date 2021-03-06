//
//  Worker.swift
//  StepJob
//
//  Created by Sirius on 13.01.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import Foundation
import ObjectMapper

class Worker: Mappable {

    var about: String?
    var age: Int?
    var enabled: Bool?
    var fullName: String?
    var gender: String?
    var id: Int?
    var jobCount: Int?
    var location: String?
    var phoneNumber: String?
    var profilePicture: String?
    var rating: Int?
    var softSkills: [String]?
    var jobs: [Job]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        about    <- map["about"]
        age    <- map["age"]
        enabled    <- map["enabled"]
        fullName    <- map["fullName"]
        gender    <- map["gender"]
        jobCount    <- map["jobCount"]
        id    <- map["id"]
        location    <- map["location"]
        phoneNumber    <- map["phoneNumber"]
        profilePicture    <- map["profilePicture"]
        location    <- map["location"]
        rating    <- map["rating"]
        softSkills    <- map["softSkills"]
        jobs    <- map["jobs"]
    }
    
}

class Job: Mappable {
    
    var address: String?
    var categoryName: String?
    var costume: String?
    var creationDate: String?
    var description: String?
    
    var equipment: String?
    var id: Int?
    var isApplied: Bool?
    var jobApplyCount: Int?
    
    var jobType: String?
    var location: String?
    var price: String?
    var priceTypeName: String?
    var status: String?
    var title: String?
    var workerCount: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        address    <- map["address"]
        categoryName    <- map["categoryName"]
        costume    <- map["costume"]
        creationDate    <- map["creationDate"]
        description    <- map["description"]
        equipment    <- map["equipment"]
        id    <- map["id"]
        isApplied    <- map["isApplied"]
        jobApplyCount    <- map["jobApplyCount"]
        jobType    <- map["jobType"]
        location    <- map["location"]
        price    <- map["price"]
        priceTypeName    <- map["priceTypeName"]
        status    <- map["status"]
        title    <- map["title"]
        workerCount    <- map["workerCount"]
        
    }
    
}
