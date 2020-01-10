//
//  CreateJobRequest.swift
//  StepJob
//
//  Created by Sirius on 24.12.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import Foundation

class CreateJobRequest: NSObject {
    
    var parameters: [String:AnyObject] = [:]
    
    func makeParameter(address:String,
                       categoryId: Int,
                       costume: String,
                       description: String,
                       districtId: Int,
                       equipment: String,
                       jobTypeId: Int,
                       price: Int,
                       priceTypeId: Int,
                       provinceId: Int,
                       title: String,
                       workerCount: Int,
                       dates: [JobDate]) -> [String:AnyObject] {
        self.parameters["address"] = address as AnyObject
        self.parameters["categoryId"] = categoryId as AnyObject
        self.parameters["costume"] = costume as AnyObject
        self.parameters["description"] = description as AnyObject
        self.parameters["districtId"] = districtId as AnyObject
        self.parameters["equipment"] = equipment as AnyObject
        self.parameters["jobTypeId"] = jobTypeId as AnyObject
        self.parameters["price"] = price as AnyObject
        self.parameters["priceTypeId"] = priceTypeId as AnyObject
        self.parameters["provinceId"] = provinceId as AnyObject
        self.parameters["title"] = title as AnyObject
        self.parameters["workerCount"] = workerCount as AnyObject
        self.parameters["dates"] = dates as AnyObject
        
        return parameters
    }
}

class JobDate: NSObject {
    
    var dailyEndDate: Date?
    var dailyStartDate: Date?
    var freelanceDateRange: String?
    var freelancePeriodId: Int?
    var partTimeDayId: Int?
    var partTimeHour: String?
    
    init(endDate: Date, startDate: Date, dateRange: String, periodId: Int, partTimeDayId: Int, partTimeHour: String) {
        self.dailyEndDate = endDate
        self.dailyStartDate = startDate
        self.freelanceDateRange = dateRange
        self.freelancePeriodId = periodId
        self.partTimeDayId = partTimeDayId
        self.partTimeHour = partTimeHour
    }
    
}
