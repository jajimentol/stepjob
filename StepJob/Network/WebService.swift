//
//  WebService.swift
//  StepJob
//
//  Created by Sirius on 13.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import Alamofire
import SVProgressHUD
import ObjectMapper

struct baseURL {
    static let prod = "http://stepjobapi.eu-central-1.elasticbeanstalk.com/"
    static let test = "stepjobapi.eu-central-1.elasticbeanstalk.com/"
}

class WebService: NSObject {
    
    let baseUrl:String = baseURL.prod

    func employerRegister(parameters:[String:AnyObject], complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "employers/register"
        SVProgressHUD.show()
        self.startRequest(.post, parameters: parameters, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func workerRegister(parameters:[String:AnyObject], complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "workers/register"
        SVProgressHUD.show()
        self.startRequest(.post, parameters: parameters, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func employerLogin(parameters:[String:AnyObject], complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "employers/login"
        SVProgressHUD.show()
        self.startRequest(.post, parameters: parameters, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func employerUpdateProfile(parameters:[String:AnyObject], complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "employers/me/update-profile"
        SVProgressHUD.show()
        self.startRequest(.put, parameters: parameters, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func employerMe(complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "employers/me"
        SVProgressHUD.show()
        self.startRequest(.get, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func employerJobs(status: String, complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "employers/jobs?jobStatus=" + status
        SVProgressHUD.show()
        self.startRequest(.get, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func approveWorker(jobId: Int, workerId: Int, parameters:[String:AnyObject], complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/employers/jobs/\(jobId)/approve-job-apply/\(workerId)"
        SVProgressHUD.show()
        self.startRequest(.post, parameters: parameters, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func makeJobPassive(jobId: Int, parameters:[String:AnyObject], complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/employers/jobs/\(jobId)/passive"
        SVProgressHUD.show()
        self.startRequest(.post, parameters: parameters, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func rejectWorker(jobId: Int, workerId: Int, parameters:[String:AnyObject], complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/employers/jobs/\(jobId)/reject-job-apply/\(workerId)"
        SVProgressHUD.show()
        self.startRequest(.post, parameters: parameters, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func removeWorker(jobId: Int, workerId: Int, parameters:[String:AnyObject], complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/employers/jobs/\(jobId)/remove-worker-job/\(workerId)"
        SVProgressHUD.show()
        self.startRequest(.post, parameters: parameters, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func workerProfile(jobId: Int, workerId: Int, parameters:[String:AnyObject], complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/employers/jobs/\(jobId)/worker-profile/\(workerId)"
        SVProgressHUD.show()
        self.startRequest(.post, parameters: parameters, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func createJob(jobId: Int, workerId: Int,
                   parameters:[String:AnyObject], complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/employers/jobs/create"
        SVProgressHUD.show()
        self.startRequest(.post, parameters: parameters, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func getJobDetail(jobId: Int, includeWorkers: Bool = false, complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/employers/jobs/detail/\(jobId)?includeWorkers=\(includeWorkers)"
        SVProgressHUD.show()
        self.startRequest(.get, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func lookupActivityAreas(complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/lookup/job/activity-areas"
        SVProgressHUD.show()
        self.startRequest(.get, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func lookupCategories(complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/lookup/job/categories"
        SVProgressHUD.show()
        self.startRequest(.get, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func lookupDays(complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/lookup/job/days"
        SVProgressHUD.show()
        self.startRequest(.get, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func lookupPeriods(complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/lookup/job/freelance-periods"
        SVProgressHUD.show()
        self.startRequest(.get, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func lookupJobTypes(complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/lookup/job/job-types"
        SVProgressHUD.show()
        self.startRequest(.get, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func lookupJobPrices(complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/lookup/job/price-types"
        SVProgressHUD.show()
        self.startRequest(.get, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func lookupJobLocations(complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/lookup/job/provinces"
        SVProgressHUD.show()
        self.startRequest(.get, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func lookupDistrictsByProvince(plateCode: Int, complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/lookup/job/provinces/\(plateCode)/districts"
        SVProgressHUD.show()
        self.startRequest(.get, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func lookupRatingTags(complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/lookup/rating/rating-tags"
        SVProgressHUD.show()
        self.startRequest(.get, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func lookupRefreshCaches(complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/lookup/refresh-cache"
        SVProgressHUD.show()
        self.startRequest(.get, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func lookupSoftWorkers(complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/lookup/worker/soft-skills"
        SVProgressHUD.show()
        self.startRequest(.get, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func createBulkRating(jobId: Int, workerId: Int, parameters:[String:AnyObject], complete:@escaping ([String:AnyObject], Bool) -> ()) ->() {
        let url = baseUrl + "/rating/createBulkRating"
        SVProgressHUD.show()
        self.startRequest(.post, parameters: parameters, urlStr: url) { (response, isNull) in
            complete(response, isNull)
        }
    }
    
    func startRequest(_ method:Alamofire.HTTPMethod, parameters:Parameters, urlStr:String, completionHandler: @escaping ([String:AnyObject],Bool) -> ())-> () {
        
        var url = urlStr
        
        let headers: HTTPHeaders = [
//            "Accept": "application/json",
            "Content-Type" : "application/json",
//            "ApplicationVersion" : Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String,
//            "h24-token" : UserDefaults.standard.object(forKey: "h24-token") as? String ?? ""
            "Authorization" : UserDefaults.standard.object(forKey: "sj-token") as? String ?? ""
        ]
        
        url = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        print(url)
        print(headers)
        print(parameters)
        
        Alamofire.request(url,method:method,parameters:parameters, encoding:JSONEncoding.default, headers:headers).responseJSON { response in
            
            //print("RESPONSE ",response.result)
            
            SVProgressHUD.dismiss()
            
            if response.result.isSuccess {
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    if JSON is NSNull {
                        completionHandler([:], true)
                    } else {
                        var isNull = false
                        
                        if JSON is [String:AnyObject]{
//                            let metadata = Mapper<Metadata>().map(JSONObject:(JSON as! [String:AnyObject])["metadata"]) ?? nil
//                            if (metadata?.responseCode == 200) {
//                                isNull = false
//                            }else{
//                                isNull = true
//                            }
                            completionHandler(JSON as! [String:AnyObject],isNull)
                        }else{
                            let dict = ["data": JSON]
                            completionHandler(dict as [String:AnyObject],isNull)
                        }
                        
                        
                    }
                }
            } else {
//                print("Error ",response.result.error.debugDescription)
//                self.handleError(response.result.error.debugDescription)
            }
        }
    }
    
    func startRequest(_ method:Alamofire.HTTPMethod, urlStr:String, completionHandler: @escaping ([String:AnyObject],Bool) -> ())-> () {
        
        var url = urlStr
        
        let headers: HTTPHeaders = [
            "Content-Type" : "application/json",
//            "ApplicationVersion" : Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String,
            //"h24-token" : "1653e9e8-8315-4465-8d2c-6dfde42dbb85"
            //"h24-token" : "789bb8e9-fd92-42c2-ae83-2e1e6235d06c"//medic
            
            "Authorization" : UserDefaults.standard.object(forKey: "sj-token") as? String ?? ""
        ]
        
        url = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        //KaldırServis
        print(url)
        print(headers)
        
        Alamofire.request(url,method:method,parameters:nil, encoding:JSONEncoding.default, headers:headers).responseJSON { response in
            
            
            
            SVProgressHUD.dismiss()
            
            if response.result.isSuccess {
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    if JSON is NSNull {
                        completionHandler([:], true)
                    } else {
                        var isNull = false
                        if JSON is [String:AnyObject]{
                            completionHandler(JSON as! [String:AnyObject],isNull)
                        }else{
                            let dict = ["data": JSON]
                            completionHandler(dict as [String:AnyObject],isNull)
                        }
                    }
                }
            } else {
//                print("Error ",response.result.error.debugDescription)
//                self.handleError(response.result.error.debugDescription)
            }
        }
    }
}
