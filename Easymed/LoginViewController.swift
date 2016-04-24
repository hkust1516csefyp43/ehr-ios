//
//  ViewController.swift
//  Easymed
//
//  Created by choi chun ho,chchoiac,20124979 on 1/4/16.
//  Copyright © 2016 John. All rights reserved.
//

import UIKit;
import Alamofire;
import SwiftyJSON;
//Save variable
var edit_patient = 0;
var edit_triage = 0;
var edit_consultation = 0;
var edit_visit = 0;
var edit_related_data = 0;
var edit_prescription = 0;

var new_related_data = 0;
var modified_related_data = 0;
var deleted_related_data = 0;
var simulate_click = 0;
var related_dataState = -1; //-1 = error, 0 = new, 1=modify
var related_data_type = -1; //1=screening, 2=Allergy, 3=diagnosis, 4=advice, 5=follow-up
var related_data_id_count = 0;
//
var patientList1 : [Patient] = [Patient]();
var patientList2 : [Patient] = [Patient]();
var currentVisit: Visit = Visit();
var currentRelatedData: related_data = related_data();
var currentPrescription: prescriptions = prescriptions();
var currentPatient : Patient = Patient();
var tempPatient: Patient = Patient();
var TriageModifyViewControllerState = -1; //-1= default, 0= new patient + add visit, 1= old patient + add visit, 2= old patient + modify visit
var FT_ITS_State = -1; //-1= default, 0=Finished Triage Onclick, 1=In this clinic Onclick
//AddVisitViewController,TriageModifyViewController
var AddVisitState = -1; //-1=default, 0=new PATIENT+ new VISIT, 1=existing PATIENT + new VISIT, 2=edit VISIT
var ConsultationState = -1; //-1=error, 0=waitlist Consultation(add consultation), 1=finished Consultation(modify consultation)
var PharmacyState = -1; //-1=error, 0=waitlist Pharmacy(modify prescripsion), 1=finished Pharmacy (modify prescripsion)

var this_clinic_id : String = "3";
var PendingSignal : Int = -1; // -1= error, 1=ThisSlumPatient, 2=Finished Slum
var token : String = "1";
var next_stage : String = "-1"; // -1= error, 1=triage, 2=consultation,
//visits
var tag: String = "1";
//triages
var userID: String = "acwaeoiwlin";
var edited_in_consultation: String = "FALSE";
var startTimeStamp: String = "1994-04-07 21:09:31.481+00";

//related_data storage
var related_dataList:[related_data] = [related_data]();
var new_related_dataList:[related_data] = [related_data]();
var modified_related_dataList:[related_data] = [related_data]();
var deleted_related_dataList:[related_data] = [related_data]();
var keywordsList:[keywords] = [keywords]();
var medicationsList:[medications] = [medications]();
var prescriptionsList: [prescriptions] = [prescriptions]();
var prescriptionsList_original: [prescriptions] = [prescriptions]();

class LoginViewController: UIViewController {
    
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //        UsernameTextField.tag=1;
        //        self.view.viewWithTag(1)?.hidden = true;
        UsernameTextField.text=nil;
        PasswordTextField.text=nil;
        
        //                let related_datajson : [String: AnyObject] = [
        //                    "data": "MODIFIED",
        //                    "remark": "MODIFIED",
        //                ];
        //        let related_dataheaders = [
        //            "token": token,
        //                    "Content-Type": "application/json"
        //        ];
//        let prescriptionsjson : [String: AnyObject] = [
//            "prescription_detail": "modified_details",
//            "prescribed": 0
//        ];
//        let prescriptionsheaders = [
//            "token": token,
//            "Content-Type": "application/json"
//        ];
//        let prescriptionsURL: String = "http://ehr-api.herokuapp.com/v2/prescriptions/RcVcK8FVbZ3G4KYH";
//        print("PUT: \(prescriptionsURL)");
//        Alamofire.request(.PUT, prescriptionsURL, parameters: prescriptionsjson, encoding: .JSON, headers: prescriptionsheaders).responseJSON { (Response) -> Void in
//            if let prescriptionsJSON = Response.result.value{
//                print("success")
//            }
//            else{
//                print("fail: PUT prescripsion")
//            }
//        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginOnclick(sender: UIButton) {
        let Username:String = String!(UsernameTextField.text);
        let Password:String = String!(PasswordTextField.text);
        
        //call api to submit username and password
        print("\(Username) , \(Password)")
        
        if(1==1){ //token correct
            let headers = [
                "token": token,
            ];
            let URL: String = "http://ehr-api.herokuapp.com/v2/medications";
            print("GET: \(URL)");
            Alamofire.request(.GET, URL, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
                if let JSON = Response.result.value{
                    medicationsList.removeAll();
                    for(var i=0 ; i<JSON.count ; i++){
                        var obj:medications = medications();
                        obj.medication_id = JSON[i]["medication_id"]as! String;
                        obj.user_id = JSON[i]["user_id"]as! String;
                        obj.medication = JSON[i]["medication"]as! String;
                        medicationsList.append(obj);
                    }
                    self.performSegueWithIdentifier("Login_MainMenu", sender: self);
                    //                    let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ConsultationModifyViewController") as! ConsultationModifyViewController;
                    //                    self.navigationController?.pushViewController(nextViewController, animated: true);
                }
                else{
                    print("Fail: Get medications tuple");
                }
            }
        }
        else{ //token incorrect
            
        };
    }
    
}

