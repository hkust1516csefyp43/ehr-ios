//
//  PendingViewController2.swift
//  Easymed
//
//  Created by choi chun ho,chchoiac,20124979 on 13/4/16.
//  Copyright © 2016 John. All rights reserved.
//
import Foundation;
import UIKit;
import Alamofire;

class PendingViewControllerFT : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headers = [
            "token": token,
        ]
        
        var visitsURL: String = "http://ehr-api.herokuapp.com/v2/visits?patient_id=0B9Tb4Nhy7pOAg47";
        
        Alamofire.request(.GET, visitsURL, parameters: nil, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
            if let visitJSON = Response.result.value{
                if(visitJSON.count != 1){
                    print("error:patient has more than 1 visits");
                }
                else{
                    currentVisit.visit_id=visitJSON[0]["visit_id"]as! String;
                    currentVisit.tag=visitJSON[0]["tag"]as! Int;
                    var triagesURL: String = "http://ehr-api.herokuapp.com/v2/triages?visit_id=\(currentVisit.visit_id)";
  
                    Alamofire.request(.GET, triagesURL, parameters: nil, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
                        if let triagesJSON = Response.result.value{
                            currentVisit.triage.triage_id=triagesJSON[0]["triage_id"]as! String;
                            currentVisit.triage.user_id = userID;
                            if let y = triagesJSON[0]["systolic"]as? Int{
                                currentVisit.triage.systolic = String(y);
                            }
                            if let y = triagesJSON[0]["diastolic"]as? Int{
                                currentVisit.triage.diastolic = String(y);
                            }
                            if let y = triagesJSON[0]["heart_rate"]as? Int{
                                currentVisit.triage.heartRate = String(y);
                            }
                            if let y = triagesJSON[0]["respiratory_rate"]as? Int{
                                currentVisit.triage.respiratoryRate = String(y);
                            }
                            if let y = triagesJSON[0]["weight"]as? Int{
                                currentVisit.triage.weight = String(y);
                            }
                            if let y = triagesJSON[0]["height"]as? Int{
                                currentVisit.triage.height = String(y);
                            }
                            if let y = triagesJSON[0]["temperature"]as? Int{
                                currentVisit.triage.temperature = String(y);
                            }
                            if let y = triagesJSON[0]["spo2"]as? Int{
                                currentVisit.triage.spo2 = String(y);
                            }
                            if let y = triagesJSON[0]["head_circumference"]as? Int{
                                currentVisit.triage.headCircumference = String(y);
                            }
                            //                    var lastDewormingTablet: String = "NULL";
                            //                    var chiefComplains: String = "NULL";
                            //                    var remark: String = "NULL";
                            //                    var editedInConsultation :String = "NULL";
                            
                            AddVisitState = 2;
                            
                            //Navigate to next controller
                            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TriageModifyViewController") as! TriageModifyViewController;
                            self.navigationController?.pushViewController(nextViewController, animated: true);
                        }
                    }
                }
            }
        }
    }
}