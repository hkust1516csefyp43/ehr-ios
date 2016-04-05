//
//  File.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation;
import UIKit;
import Alamofire;

class PendingViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var backEndFinish = false;
        patientList1.removeAll();
        patientList2.removeAll();
        let headers = [
            "token": token,
        ]
        if(signal == 1){   //get all patients in this slum
            var URL1: String = "http://ehr-testing.herokuapp.com/v2/patients?clinic_id=\(this_clinic_id)&next_station=2";
            print("signal: \(signal) \n url: \(URL1)");
            Alamofire.request(.GET, URL1, parameters: nil, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
                if let JSON = Response.result.value{
                    for(var i=0; i<JSON.count; i++){
                        var p1:Patient = Patient();
                        let b=JSON[i];
                        if let y = b["patient_id"] as? String{
                            p1.patient_id = y;
                        }
                        else{
                            print("error, cannot get patient_id");
                        }
                        if let y = b["honorific"] as? String{
                            p1.honorific = y;
                        }
                        if let y = b["first_name"] as? String{
                            p1.first_name = y;
                        }
                        else{
                            print("error, cannot get first_name");
                        }
                        if let y = b["middle_name"] as? String{
                            p1.middle_name = y;
                        }
                        if let y = b["last_name"] as? String{
                            p1.last_name = y;
                        }
                        if let y = b["address"] as? String{
                            p1.address = y;
                        }
                        if let y = b["email"] as? String{
                            p1.email = y;
                        }
                        if let y = b["birth_year"] as? Int{
                            p1.birth_year = y;
                        }
                        if let y = b["birth_month"] as? Int{
                            p1.birth_month = y;
                        }
                        if let y = b["birth_date"] as? Int{
                            p1.birth_date = y;
                        }
                        if let y = b["clinic_id"] as? String{
                            p1.clinic_id = y;
                        }
                        if let y = b["gender_id"] as? String{
                            p1.gender_id = y;
                        }
                        if let y = b["image_id"] as? String{
                            p1.image_id = y;
                        }
                        if let y = b["blood_type_id"] as? String{
                            p1.blood_type_id = y;
                        }
                        if let y = b["phone_number_country_code"] as? String{
                            p1.phone_number_country_code = y;
                        }
                        if let y = b["phone_number"] as? String{
                            p1.phone_number = y;
                        }
                        if let y = b["native_name"] as? String{
                            p1.natvie_name = y;
                        }
                        patientList1.append(p1);
                    }
                    if(backEndFinish==true){
                        print("\(patientList1.count)  ,  \(patientList2.count)");
                        self.performSegueWithIdentifier("Pending_Triage", sender: self);
                    }
                    else{
                        backEndFinish=true
                    }
                }
                else{
                    print("Error: Cannot get PatientList");
                }
            }
            var URL2: String = "http://ehr-testing.herokuapp.com/v2/patients?clinic_id=\(this_clinic_id)";
            print("signal: \(signal) \n url: \(URL2)");
           Alamofire.request(.GET, URL2, parameters: nil, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
                if let JSON = Response.result.value{
                    for(var i=0; i<JSON.count; i++){
                        var p1:Patient = Patient();
                        let b=JSON[i];
                        if let y = b["patient_id"] as? String{
                            p1.patient_id = y;
                        }
                        else{
                            print("error, cannot get patient_id");
                        }
                        if let y = b["honorific"] as? String{
                            p1.honorific = y;
                        }
                        if let y = b["first_name"] as? String{
                            p1.first_name = y;
                        }
                        else{
                            print("error, cannot get first_name");
                        }
                        if let y = b["middle_name"] as? String{
                            p1.middle_name = y;
                        }
                        if let y = b["last_name"] as? String{
                            p1.last_name = y;
                        }
                        if let y = b["address"] as? String{
                            p1.address = y;
                        }
                        if let y = b["email"] as? String{
                            p1.email = y;
                        }
                        if let y = b["birth_year"] as? Int{
                            p1.birth_year = y;
                        }
                        if let y = b["birth_month"] as? Int{
                            p1.birth_month = y;
                        }
                        if let y = b["birth_date"] as? Int{
                            p1.birth_date = y;
                        }
                        if let y = b["clinic_id"] as? String{
                            p1.clinic_id = y;
                        }
                        if let y = b["gender_id"] as? String{
                            p1.gender_id = y;
                        }
                        if let y = b["image_id"] as? String{
                            p1.image_id = y;
                        }
                        if let y = b["blood_type_id"] as? String{
                            p1.blood_type_id = y;
                        }
                        if let y = b["phone_number_country_code"] as? String{
                            p1.phone_number_country_code = y;
                        }
                        if let y = b["phone_number"] as? String{
                            p1.phone_number = y;
                        }
                        if let y = b["native_name"] as? String{
                            p1.natvie_name = y;
                        }
                        patientList2.append(p1);
                    }
                    if(backEndFinish==true){
                        print("\(patientList1.count)  ,  \(patientList2.count)");
                        self.performSegueWithIdentifier("Pending_Triage", sender: self);
                    }
                    else{
                        backEndFinish=true
                    }
                }
                else{
                    print("Error: Cannot get PatientList");
                }
            }
        }
    }
}