//
//  ViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit
import PagingMenuController
import Alamofire

class TriageModifyViewController: UIViewController, PagingMenuControllerDelegate {
    let date_1 = NSDate()
    let calendar_1 = NSCalendar.currentCalendar()
    var timeString = ""
    
    override func viewDidLoad() {
        var components_1 = calendar_1.components([NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: date_1);
        timeString = "\(components_1.year)-\(components_1.month)-\(components_1.day) \(components_1.hour):\(components_1.minute):\(components_1.second)";
        
        //keyboard
        self.hideKeyboardWhenTappedAround()
        
        
        super.viewDidLoad()
        //Copy currentPatient data to Temp, so all temp patient modify will save at there
        if(AddVisitState==0){ //new patient
            currentVisit = Visit();
            currentAttachments=attachments();
        }
        else if(AddVisitState==1){ //existing patient
            
        }
        else if(AddVisitState==2){//edit visitng
            
        }
        else{
            print("error: Variable 'AddVisitState'")
        }
        //Add sliding page+button
        let personaldataViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PersonalDataViewController") as! PersonalDataViewController;
        let vitalsignsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("VitalSignsViewController") as! VitalSignsViewController;
        let chiefcomplainViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ChiefComplainViewController") as! ChiefComplainViewController;
        let remarkViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RemarkViewController") as! RemarkViewController;
        
        //        let hpiViewController = self.storyboard?.instantiateViewControllerWithIdentifier("HPIViewController") as! HPIViewController;
        //        let previousmedicalhistoryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PreviousMedicalHistoryViewController") as! PreviousMedicalHistoryViewController;
        //        let familyhistoryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("FamilyHistoryViewController") as! FamilyHistoryViewController;
        //        let socialhistoryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SocialHistoryViewController") as! SocialHistoryViewController;
        //        let drughistoryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DrugHistoryViewController") as! DrugHistoryViewController;
        //        let screeningViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ScreeningViewController") as! ScreeningViewController;
        //        let allergyViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AllergyViewController") as! AllergyViewController;
        //        let pregnancyViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PregnancyViewController") as! PregnancyViewController;
        //        let reviewofthesystemViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ReviewOfTheSystemViewController") as! ReviewOfTheSystemViewController;
        
        //Finishted Triage Case
        let triagemodifyFTViewController = [personaldataViewController,vitalsignsViewController,chiefcomplainViewController,remarkViewController];
        //        let triagemodifyFTViewController = [personaldataViewController,chiefcomplainViewController,remarkViewController];
        let options = PagingMenuOptions()
        options.menuHeight = 30
        
        let pagingmenuController = self.childViewControllers.first as! PagingMenuController
        pagingmenuController.delegate = self;
        pagingmenuController.setup(viewControllers: triagemodifyFTViewController, options: options)
        
        //Add navigationbar button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Confirm", style: .Plain, target: self, action:"SaveButtonOnclick:")
    }
    
    
    func SaveButtonOnclick(sender: UIBarButtonItem) {
        
        //Handle input=""
        var trimString = currentVisit.patient.first_name.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            // TASK WARNING FOR FIRST NAME NULL
            print("First name cannot be NULL")
        }
        trimString = currentVisit.patient.last_name.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            currentVisit.patient.last_name="NULL";
        }
        trimString = currentVisit.patient.address.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            currentVisit.patient.address="NULL";
        }
        trimString = currentVisit.patient.phone_number.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            currentVisit.patient.phone_number="NULL";
        }
        trimString = currentVisit.triage.systolic.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            currentVisit.triage.systolic="0";
        }
        trimString = currentVisit.triage.diastolic.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            currentVisit.triage.diastolic="0";
        }
        trimString = currentVisit.triage.heartRate.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            currentVisit.triage.heartRate="0";
        }
        trimString = currentVisit.triage.respiratoryRate.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            currentVisit.triage.respiratoryRate="0";
        }
        trimString = currentVisit.triage.spo2.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            currentVisit.triage.spo2="0";
        }
        trimString = currentVisit.triage.temperature.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            currentVisit.triage.temperature="0";
        }
        trimString = currentVisit.triage.weight.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            currentVisit.triage.weight="0";
        }
        trimString = currentVisit.triage.height.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            currentVisit.triage.height="0";
        }
        trimString = currentVisit.triage.chiefComplains.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            currentVisit.triage.chiefComplains="NULL";
        }
        trimString = currentVisit.triage.remark.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            currentVisit.triage.remark="NULL";
        }
        
        //Start create data in database
        if(AddVisitState==0){
            AddVisitState = -1;
            if(edit_attachments==1){
                let attachmentsjson: [String:AnyObject]=[
                    //                    "attachment_id":currentAttachments.attachment_id,
                    //                    "cloudinary_url":currentAttachments.cloudinary_url,
                    "file_name":"PROFILE_pic",
                    "user_id":userID,
                    "create_timestamp":timeString ,
                    "file_in_base64":currentAttachments.file_in_base64,
                    //                    "file_in_base64":"testing"
                ]
                let headers = [
                    "token": token,
                    "Content-Type": "application/json"
                ];
                
                let attachmentsURL: String = "http://ehr-api.herokuapp.com/v2/attachments";
                print("POST: \(attachmentsURL)");
                Alamofire.request(.POST, attachmentsURL, parameters: attachmentsjson, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
                    if let attachmentsJSON = Response.result.value{
                        print("SUCCESS: POST attachments tuple with visitstate=0")
                        
                        // POST patients
                        let patientsjson : [String: AnyObject] = [
                            "honorific":currentVisit.patient.honorific,
                            "first_name": currentVisit.patient.first_name,
                            "middle_name":currentVisit.patient.middle_name,
                            "last_name": currentVisit.patient.last_name,
                            "address":currentVisit.patient.address,
                            "email":currentVisit.patient.email,
                            //ref
                            "clinic_id": this_clinic_id,
                            //ref
                            "gender_id": "caw23232",
                            "birth_year":currentVisit.patient.birth_year,
                            "birth_month":currentVisit.patient.birth_month,
                            "birth_date":currentVisit.patient.birth_date,
                            //ref value
                            //                "blood_type_id":currentVisit.patient.blood_type_id,
                            //ref value
                            "image_id":attachmentsJSON["attachment_id"]as! String,
                            "phone_number_country_code":"2",
                            "phone_number":currentVisit.patient.phone_number,
                            "native_name":currentVisit.patient.natvie_name
                        ];
                        
                        
                        let patientsURL: String = "http://ehr-api.herokuapp.com/v2/patients";
                        print("POST: \(patientsURL)");
                        Alamofire.request(.POST, patientsURL, parameters: patientsjson, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
                            if let patientsJSON = Response.result.value{
                                
                                
                                // POST visits
                                let visitsjson : [String: AnyObject] = [
                                    "patient_id": patientsJSON["patient_id"] as! String,
                                    "tag": tag,
                                    "next_station": currentVisit.next_station
                                ];
                                
                                let visitsURL: String = "http://ehr-api.herokuapp.com/v2/visits";
                                print("POST: \(visitsURL)");
                                Alamofire.request(.POST, visitsURL, parameters: visitsjson, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
                                    if let visitsJSON = Response.result.value{
                                        print("SUCCESS: POST visits tuple with visits state=0")
                                        // POST triages
                                        let triagesjson : [String: AnyObject] = [
                                            "visit_id": visitsJSON["visit_id"] as! String,
                                            "user_id": userID,
                                            "systolic": Int(currentVisit.triage.systolic)!,
                                            "diastolic": Int(currentVisit.triage.diastolic)!,
                                            "heart_rate": Int(currentVisit.triage.heartRate)!,
                                            "respiratory_rate": Int(currentVisit.triage.respiratoryRate)!,
                                            "weight":Int(currentVisit.triage.weight)!,
                                            "height":Int(currentVisit.triage.height)!,
                                            "temperature":Int(currentVisit.triage.temperature)!,
                                            "spo2":Int(currentVisit.triage.spo2)!,
                                            //                                                               "last_deworming_tablet":currentVisit.triage.lastDewormingTablet,
                                            "chief_complains":currentVisit.triage.chiefComplains,
                                            "remark":currentVisit.triage.remark,
                                            "start_timestamp":self.timeString,
                                            "end_timestamp":visitsJSON["create_timestamp"] as! String,
                                            //                                "edited_in_consultation":"FALSE",
                                            //                                "head_circumference":currentVisit.triage.headCircumference
                                        ];
                                        
                                        let triagesURL: String = "http://ehr-api.herokuapp.com/v2/triages";
                                        print("POST: \(triagesURL)");
                                        Alamofire.request(.POST, triagesURL, parameters: triagesjson, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
                                            if let triagesJSON = Response.result.value{
                                                print("SUCCESS: POST triages tuple with visitstate=0");
                                                //Call Next View Controller
                                                let nextController = self.storyboard?.instantiateViewControllerWithIdentifier("PendingViewController") as! PendingViewController;
                                                self.navigationController?.pushViewController(nextController, animated: true);
                                            }
                                            else{
                                                print("FAIL: POST triages tuple with visitstate=0")
                                                return;
                                            }
                                        }
                                    }
                                    else{
                                        print("FAIL: POST visits tuple with visitstate=0")
                                        return;
                                    }
                                }
                            }
                            else{
                                print("FAIL: POST patients tuple with visitstate=0")
                                return;
                            }
                        }
                    }
                    else{
                        print("FAIL: POST attachments tuple with visitstate=0")
                        return;
                    }
                }
            }
            else{
                // POST patients
                let patientsjson : [String: AnyObject] = [
                    "honorific":currentVisit.patient.honorific,
                    "first_name": currentVisit.patient.first_name,
                    "middle_name":currentVisit.patient.middle_name,
                    "last_name": currentVisit.patient.last_name,
                    "address":currentVisit.patient.address,
                    "email":currentVisit.patient.email,
                    //ref
                    "clinic_id": this_clinic_id,
                    //ref
                    "gender_id": "caw23232",
                    "birth_year":currentVisit.patient.birth_year,
                    "birth_month":currentVisit.patient.birth_month,
                    "birth_date":currentVisit.patient.birth_date,
                    //ref value
                    //                "blood_type_id":currentVisit.patient.blood_type_id,
                    //ref value
                    "phone_number_country_code":"2",
                    "phone_number":currentVisit.patient.phone_number,
                    "native_name":currentVisit.patient.natvie_name
                ];
                
                let patientsheaders = [
                    "token": token,
                    "Content-Type": "application/json"
                ];
                let patientsURL: String = "http://ehr-api.herokuapp.com/v2/patients";
                print("POST: \(patientsURL)");
                Alamofire.request(.POST, patientsURL, parameters: patientsjson, encoding: .JSON, headers: patientsheaders).responseJSON { (Response) -> Void in
                    if let patientsJSON = Response.result.value{
                        
                        
                        // POST visits
                        let visitsjson : [String: AnyObject] = [
                            "patient_id": patientsJSON["patient_id"] as! String,
                            "tag": tag,
                            "next_station": currentVisit.next_station
                        ];
                        let visitsheaders = [
                            "token": token,
                            "Content-Type": "application/json"
                        ];
                        let visitsURL: String = "http://ehr-api.herokuapp.com/v2/visits";
                        print("POST: \(visitsURL)");
                        Alamofire.request(.POST, visitsURL, parameters: visitsjson, encoding: .JSON, headers: visitsheaders).responseJSON { (Response) -> Void in
                            if let visitsJSON = Response.result.value{
                                print("SUCCESS: POST visits tuple with visits state=0")
                                // POST triages
                                let triagesjson : [String: AnyObject] = [
                                    "visit_id": visitsJSON["visit_id"] as! String,
                                    "user_id": userID,
                                    "systolic": Int(currentVisit.triage.systolic)!,
                                    "diastolic": Int(currentVisit.triage.diastolic)!,
                                    "heart_rate": Int(currentVisit.triage.heartRate)!,
                                    "respiratory_rate": Int(currentVisit.triage.respiratoryRate)!,
                                    "weight":Int(currentVisit.triage.weight)!,
                                    "height":Int(currentVisit.triage.height)!,
                                    "temperature":Int(currentVisit.triage.temperature)!,
                                    "spo2":Int(currentVisit.triage.spo2)!,
                                    //                                                               "last_deworming_tablet":currentVisit.triage.lastDewormingTablet,
                                    "chief_complains":currentVisit.triage.chiefComplains,
                                    "remark":currentVisit.triage.remark,
                                    "start_timestamp":self.timeString ,
                                    "end_timestamp":visitsJSON["create_timestamp"] as! String,
                                    //                                "edited_in_consultation":"FALSE",
                                    //                                "head_circumference":currentVisit.triage.headCircumference
                                ];
                                let triagesheaders = [
                                    "token": token,
                                    "Content-Type": "application/json"
                                ];
                                let triagesURL: String = "http://ehr-api.herokuapp.com/v2/triages";
                                print("POST: \(triagesURL)");
                                Alamofire.request(.POST, triagesURL, parameters: triagesjson, encoding: .JSON, headers: triagesheaders).responseJSON { (Response) -> Void in
                                    if let triagesJSON = Response.result.value{
                                        print(triagesJSON);
                                        //Call Next View Controller
                                        let nextController = self.storyboard?.instantiateViewControllerWithIdentifier("PendingViewController") as! PendingViewController;
                                        self.navigationController?.pushViewController(nextController, animated: true);
                                    }
                                    else{
                                        print("FAIL: POST patient tuple with visitstate=0")
                                        return;
                                    }
                                }
                            }
                            else{
                                print("FAIL: POST visit tuple with visitstate=0")
                                return;
                            }
                        }
                    }
                }
            }
        }
        else if(AddVisitState==1){
            AddVisitState = -1;
            let headers = [
                "token": token,
                "Content-Type": "application/json"
            ];
            
            if(edit_patient==1 && edit_attachments>0){
                let attachmentsjson: [String:AnyObject]=[
                    //                    "attachment_id":currentAttachments.attachment_id,
                    //                    "cloudinary_url":currentAttachments.cloudinary_url,
                    "file_name":"PROFILE_pic_\(currentPatient.patient_id)",
                    "user_id":userID,
                    "create_timestamp":timeString ,
                    "file_in_base64":currentAttachments.file_in_base64,
                    //                    "file_in_base64":"testing"
                ]
                
                let attachmentsURL: String = "http://ehr-api.herokuapp.com/v2/attachments";
                print("POST: \(attachmentsURL)");
                Alamofire.request(.POST, attachmentsURL, parameters: attachmentsjson, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
                    if let attachmentsJSON = Response.result.value{
                        print("SUCCESS: POST attachments tuple with addvisitstate=1")
                        // PUT patients
                        let patientsjson : [String: AnyObject] = [
                            "honorific":currentVisit.patient.honorific,
                            "first_name": currentVisit.patient.first_name,
                            "middle_name":currentVisit.patient.middle_name,
                            "last_name": currentVisit.patient.last_name,
                            "address":currentVisit.patient.address,
                            "email":currentVisit.patient.email,
                            //ref
                            "gender_id": "caw23232",
//                            "birth_year":currentVisit.patient.birth_year,
//                            "birth_month":currentVisit.patient.birth_month,
//                            "birth_date":currentVisit.patient.birth_date,
                            "image_id":attachmentsJSON["attachment_id"]as! String,
                            //ref value
//                                            "blood_type_id":currentVisit.patient.blood_type_id,
                            //ref value
//                            "phone_number_country_code":currentVisit.patient.phone_number_country_code,
//                            "phone_number":currentVisit.patient.phone_number,
//                            "native_name":currentVisit.patient.natvie_name
                        ];
                        
                        let patientsURL: String = "http://ehr-api.herokuapp.com/v2/patients/\(currentVisit.patient.patient_id)";
                        print("PUT: \(patientsURL)");
                        Alamofire.request(.PUT, patientsURL, parameters: patientsjson, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
                            if let patientsJSON = Response.result.value{
                                print("Success: PUT patient tuple");
                                if(edit_triage==0){
                                    //Navigate to next controller
                                    let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PendingViewController") as! PendingViewController;
                                    self.navigationController?.pushViewController(nextViewController, animated: true);
                                }
                                else{
                                    edit_patient=0;
                                }
                            }
                            else{
                                print("Fail: PUT patient tuple with visitstate=1 && new attachments");
                                return;
                            }
                        }
                    }
                    else{
                        print("FAIL: POST attachments tuple with visitstate=1")
                        return;
                    }
                }
            }
            else if(edit_patient==1){
                // PUT patients
                let patientsjson : [String: AnyObject] = [
                    "honorific":currentVisit.patient.honorific,
                    "first_name": currentVisit.patient.first_name,
                    "middle_name":currentVisit.patient.middle_name,
                    "last_name": currentVisit.patient.last_name,
                    "address":currentVisit.patient.address,
                    "email":currentVisit.patient.email,
                    //ref
                    "gender_id": "caw23232",
//                    "birth_year":currentVisit.patient.birth_year,
//                    "birth_month":currentVisit.patient.birth_month,
//                    "birth_date":currentVisit.patient.birth_date,
                    //ref value
                    //                "blood_type_id":currentVisit.patient.blood_type_id,
                    //ref value
                    "phone_number_country_code":currentVisit.patient.phone_number_country_code,
                    "phone_number":currentVisit.patient.phone_number,
                    "native_name":currentVisit.patient.natvie_name
                ];
                
                let patientsURL: String = "http://ehr-api.herokuapp.com/v2/patients/\(currentVisit.patient.patient_id)";
                print("PUT: \(patientsURL)");
                Alamofire.request(.PUT, patientsURL, parameters: patientsjson, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
                    if let patientsJSON = Response.result.value{
                        print("Success: PUT patient tuple");
                        
                        if(edit_triage==0){
                            //Navigate to next controller
                            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PendingViewController") as! PendingViewController;
                            self.navigationController?.pushViewController(nextViewController, animated: true);
                        }
                        else{
                            edit_patient=0;
                        }
                    }
                    else{
                        print("Fail: PUT patient tuple");
                    }
                }
                
            }
            
            
            // POST visits
            let visitsjson : [String: AnyObject] = [
                "patient_id": currentVisit.patient.patient_id,
                "tag": tag,
                "next_station": 2,
            ];
            let visitsheaders = [
                "token": token,
                "Content-Type": "application/json"
            ];
            let visitsURL: String = "http://ehr-api.herokuapp.com/v2/visits";
            print("POST: \(visitsURL)");
            Alamofire.request(.POST, visitsURL, parameters: visitsjson, encoding: .JSON, headers: visitsheaders).responseJSON { (Response) -> Void in
                if let visitsJSON = Response.result.value{
                   print("SUCCESS: POST visits tuple with visitstate=1");
                    // POST triages
                    let triagesjson : [String: AnyObject] = [
                        "visit_id": visitsJSON["visit_id"] as! String,
                        "user_id": userID,
                        "systolic": Int(currentVisit.triage.systolic)!,
                        "diastolic": Int(currentVisit.triage.diastolic)!,
                        "heart_rate": Int(currentVisit.triage.heartRate)!,
                        "respiratory_rate": Int(currentVisit.triage.respiratoryRate)!,
                        "weight":Int(currentVisit.triage.weight)!,
                        "height":Int(currentVisit.triage.height)!,
                        "temperature":Int(currentVisit.triage.temperature)!,
                        "spo2":Int(currentVisit.triage.spo2)!,
//                        "last_deworming_tablet":currentVisit.triage.lastDewormingTablet,
                        "chief_complains":currentVisit.triage.chiefComplains,
                        "remark":currentVisit.triage.remark,
                        "start_timestamp":self.timeString,
                        "end_timestamp":visitsJSON["create_timestamp"] as! String,
                        //                                "edited_in_consultation":"FALSE",
                        //                                "head_circumference":currentVisit.triage.headCircumference
                    ];
                    
                    let triagesURL: String = "http://ehr-api.herokuapp.com/v2/triages";
                    print("POST: \(triagesURL)");
                    Alamofire.request(.POST, triagesURL, parameters: triagesjson, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
                        if let triagesJSON = Response.result.value{
                            print("SUCCESS: POST triages tuple with visitstate=1");
                            if(edit_patient==0){
                                //Navigate to next controller
                                let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PendingViewController") as! PendingViewController;
                                self.navigationController?.pushViewController(nextViewController, animated: true);
                            }
                            else{
                                edit_triage=0;
                            }
                        }
                        else{
                            print("Fail: POST triages tuple")
                            return;
                        }
                    }
                }
                else{
                    print("Fail: POST visits tuple")
                    return;
                }
            }
        }
        else if(AddVisitState==2){
            print("-------------------------\(currentVisit.patient.birth_year) / \(currentVisit.patient.birth_month) / \(currentVisit.patient.birth_date)");
            AddVisitState = -1;
            if(edit_patient == 1){
                // PUT patients
                let patientsjson : [String: AnyObject] = [
                    "honorific":currentVisit.patient.honorific,
                    "first_name": currentVisit.patient.first_name,
                    "middle_name":currentVisit.patient.middle_name,
                    "last_name": currentVisit.patient.last_name,
                    "address":currentVisit.patient.address,
                    "email":currentVisit.patient.email,
                    //ref
                    "gender_id": "caw23232",
                    "birth_year":currentVisit.patient.birth_year,
                    "birth_month":currentVisit.patient.birth_month,
                    "birth_date":currentVisit.patient.birth_date,
                    //ref value
                    //                "blood_type_id":currentVisit.patient.blood_type_id,
                    //ref value
                    "phone_number_country_code":currentVisit.patient.phone_number_country_code,
                    "phone_number":currentVisit.patient.phone_number,
                    "native_name":currentVisit.patient.natvie_name
                ];
                
                let patientsheaders = [
                    "token": token,
                    "Content-Type": "application/json"
                ];
                let patientsURL: String = "http://ehr-api.herokuapp.com/v2/patients/\(currentVisit.patient.patient_id)";
                print("PUT: \(patientsURL)");
                Alamofire.request(.PUT, patientsURL, parameters: patientsjson, encoding: .JSON, headers: patientsheaders).responseJSON { (Response) -> Void in
                    if let patientsJSON = Response.result.value{
                        print("Success: PUT patient tuple");
                        edit_patient=0;
                        if(edit_triage==0){
                            //Navigate to next controller
                            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PendingViewController") as! PendingViewController;
                            self.navigationController?.pushViewController(nextViewController, animated: true);
                        }
                    }
                    else{
                        print("Fail: PUT patient tuple");
                        return;
                    }
                }
            }
            if(edit_triage == 1){
                let date_2 = NSDate()
                let calendar_2 = NSCalendar.currentCalendar()
                var components_2 = calendar_2.components([NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: date_2);
                timeString = "\(components_2.year)-\(components_2.month)-\(components_2.day) \(components_2.hour):\(components_2.minute):\(components_2.second)";
                // PUT triages
                let triagesjson : [String: AnyObject] = [
                    "user_id": userID,
                    "systolic": Int(currentVisit.triage.systolic)!,
                    "diastolic": Int(currentVisit.triage.diastolic)!,
                    "heart_rate": Int(currentVisit.triage.heartRate)!,
                    "respiratory_rate": Int(currentVisit.triage.respiratoryRate)!,
                    "weight":Int(currentVisit.triage.weight)!,
                    "height":Int(currentVisit.triage.height)!,
                    "temperature":Int(currentVisit.triage.temperature)!,
                    "spo2":Int(currentVisit.triage.spo2)!,
                    //                               "last_deworming_tablet":currentVisit.triage.lastDewormingTablet,
                    "chief_complains":currentVisit.triage.chiefComplains,
                    "remark":currentVisit.triage.remark,
                    //                   "start_timestamp":startTimeStamp,
                    "end_timestamp":timeString,
                    //"edited_in_consultation":"FALSE",
                    "head_circumference":Int(currentVisit.triage.headCircumference)!
                ];
                let triagesheaders = [
                    "token": token,
                    "Content-Type": "application/json"
                ];
                let triagesURL: String = "http://ehr-api.herokuapp.com/v2/triages/\(currentVisit.triage.triage_id)";
                print("POST: \(triagesURL)");
                Alamofire.request(.PUT, triagesURL, parameters: triagesjson, encoding: .JSON, headers: triagesheaders).responseJSON { (Response) -> Void in
                    if let triagesJSON = Response.result.value{
                        print("Success: PUT triage tuple");
                        edit_triage=0;
                        if(edit_patient==0){
                            //Navigate to next controller
                            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PendingViewController") as! PendingViewController;
                            self.navigationController?.pushViewController(nextViewController, animated: true);
                        }
                    }
                    else{
                        print("Fail: PUT triage tuple");
                    }
                }
                
            }
        }
    }
    
    
    
    
    //                    // POST visits
    //                    let visitsjson : [String: AnyObject] = [
    //                        "patient_id": patientsJSON["patient_id"] as! String,
    //                        "tag": tag,
    //                        "next_station": currentVisit.next_station
    //                    ];
    //                    let visitsheaders = [
    //                        "token": token,
    //                        "Content-Type": "application/json"
    //                    ];
    //                    let visitsURL: String = "http://ehr-testing.herokuapp.com/v2/visits";
    //                    print("POST: \(visitsURL)");
    //                    Alamofire.request(.POST, visitsURL, parameters: visitsjson, encoding: .JSON, headers: visitsheaders).responseJSON { (Response) -> Void in
    //                        if let visitsJSON = Response.result.value{
    //
    //                            print(currentVisit.triage.systolic)
    //                            print(currentVisit.triage.diastolic)
    //                            // POST triages
    //                            let triagesjson : [String: AnyObject] = [
    //                                "visit_id": visitsJSON["visit_id"] as! String,
    //                                "user_id": userID,
    //                                "systolic": Int(currentVisit.triage.systolic)!,
    //                                "diastolic": Int(currentVisit.triage.diastolic)!,
    //                                "heart_rate": Int(currentVisit.triage.heartRate)!,
    //                                "respiratory_rate": Int(currentVisit.triage.respiratoryRate)!,
    //                                "weight":Int(currentVisit.triage.weight)!,
    //                                //                                "height":Int(currentVisit.triage.height)!,
    //                                "temperature":Int(currentVisit.triage.temperature)!,
    //                                "spo2":Int(currentVisit.triage.spo2)!,
    //                                //                               "last_deworming_tablet":currentVisit.triage.lastDewormingTablet,
    //                                //                                "chief_complains":currentVisit.triage.chiefComplains,
    //                                //                                "remark":currentVisit.triage.remark,
    //                                "start_timestamp":startTimeStamp,
    //                                "end_timestamp":visitsJSON["create_timestamp"] as! String,
    //                                //                                "edited_in_consultation":"FALSE",
    //                                //                                "head_circumference":currentVisit.triage.headCircumference
    //                            ];
    //                            let triagesheaders = [
    //                                "token": token,
    //                                "Content-Type": "application/json"
    //                            ];
    //                            let triagesURL: String = "http://ehr-testing.herokuapp.com/v2/triages";
    //                            print("POST: \(triagesURL)");
    //                            Alamofire.request(.POST, triagesURL, parameters: triagesjson, encoding: .JSON, headers: triagesheaders).responseJSON { (Response) -> Void in
    //                                if let triagesJSON = Response.result.value{
    //                                    print(triagesJSON);
    //                                    //Call Next View Controller
    //                                    let nextController = self.storyboard?.instantiateViewControllerWithIdentifier("PendingViewController") as! PendingViewController;
    //                                    self.navigationController?.pushViewController(nextController, animated: true);
    //                                }
    //                            }
    //}
    //}
    //}
    //}
    //}
    
    //        currentPatient.Compare(tempPatient);
    //        currentPatient.getInformation();
    //        currentVisit.patient.getInformation();
    //}
    @IBAction func BackOnclick(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    func willMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
        
    }
    
    func didMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
        
    }
}

