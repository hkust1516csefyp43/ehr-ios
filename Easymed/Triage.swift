//
//  User.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 8/3/16.
//  Copyright © 2016 John. All rights reserved.
//

class Triage{
    var triage_id: String = "NULL";
    var user_id: String = "NULL";
    var systolic: String = "0";
    var diastolic: String = "0";
    var heartRate: String = "0";
    var respiratoryRate: String = "0";
    var weight: String = "0";
    var height: String = "0";
    var temperature: String = "0";
    var spo2: String = "0";
    var lastDewormingTablet: String = "NULL";
    var chiefComplains: String = "NULL";
    var remark: String = "NULL";
    var startedTimeStamp = 0;//TODO: find libarary to change it
    var endTimeStamp  = 0; //TODO: find libarary to change it
    var editedInConsultation :String = "NULL";
    var headCircumference: String = "0"; //TODO: what is this
    init(){
        
    }
}

//// POST patients
//let patientsjson : [String: AnyObject] = [
//    "first_name": "TomW",
//    "clinic_id": "3",
//    "gender_id": "caw23232"
//];
//let patientsheaders = [
//    "token": token,
//    "Content-Type": "application/json"
//];
//var patientsURL: String = "http://ehr-testing.herokuapp.com/v2/patients";
//print("POST: \(patientsURL)");
//Alamofire.request(.POST, patientsURL, parameters: patientsjson, encoding: .JSON, headers: patientsheaders).responseJSON { (Response) -> Void in
//    if let patientsJSON = Response.result.value{
//        
//        
//        // POST visits
//        let visitsjson : [String: AnyObject] = [
//            "patient_id": patientsJSON["patient_id"] as! String,
//            "tag": tag,
//        ];
//        let visitsheaders = [
//            "token": token,
//            "Content-Type": "application/json"
//        ];
//        var visitsURL: String = "http://ehr-testing.herokuapp.com/v2/visits";
//        print("POST: \(visitsURL)");
//        Alamofire.request(.POST, visitsURL, parameters: visitsjson, encoding: .JSON, headers: visitsheaders).responseJSON { (Response) -> Void in
//            if let visitsJSON = Response.result.value{
//                
//                
//                // POST triages
//                let triagesjson : [String: AnyObject] = [
//                    "visit_id": visitsJSON["visit_id"] as! String,
//                    "user_id": userID,
//                    "edited_in_consultation":"FALSE",
//                    "start_timestamp":startTimeStamp,
//                    "end_timestamp":visitsJSON["create_timestamp"] as! String
//                ];
//                let triagesheaders = [
//                    "token": token,
//                    "Content-Type": "application/json"
//                ];
//                var triagesURL: String = "http://ehr-testing.herokuapp.com/v2/triages";
//                print("POST: \(triagesURL)");
//                Alamofire.request(.POST, triagesURL, parameters: triagesjson, encoding: .JSON, headers: triagesheaders).responseJSON { (Response) -> Void in
//                    if let triagesJSON = Response.result.value{
//                        print(triagesJSON);
//                    }
//                }
//            }
//        }
//    }
//}