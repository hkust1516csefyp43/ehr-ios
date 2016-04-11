//
//  ViewController.swift
//  Easymed
//
//  Created by choi chun ho,chchoiac,20124979 on 1/4/16.
//  Copyright © 2016 John. All rights reserved.
//

import UIKit;
import Alamofire;

//Save variable
var edit_patient = 0;
var edit_triage = 0;

//
var patientList1 : [Patient] = [Patient]();
var patientList2 : [Patient] = [Patient]();
var currentVisit: Visit = Visit();
var currentPatient : Patient = Patient();
var tempPatient: Patient = Patient();
var TriageModifyViewControllerState = -1; //-1= default, 0= new patient + add visit, 1= old patient + add visit, 2= old patient + modify visit
var FT_ITS_State = -1; //-1= default, 0=Finished Triage Onclick, 1=In this clinic Onclick
//AddVisitViewController,TriageModifyViewController
var AddVisitState = -1; //-1=default, 0=new PATIENT+ new VISIT, 1=existing PATIENT + new VISIT, 2=edit VISIT
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

class LoginViewController: UIViewController {
    
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UsernameTextField.text=nil;
        PasswordTextField.text=nil;
        
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
                    var triage_id: String = "NULL";
                    var user_id: String = "NULL";
                    var systolic: String = "NULL";
                    var diastolic: String = "NULL";
                    var heartRate: String = "NULL";
                    var respiratoryRate: String = "NULL";
                    var weight: String = "NULL";
                    var height: String = "NULL";
                    var temperature: String = "NULL";
                    var spo2: String = "NULL";
                    var lastDewormingTablet: String = "NULL";
                    var chiefComplains: String = "NULL";
                    var remark: String = "NULL";
                    var editedInConsultation :String = "NULL";
                    var headCircumference: String = "NULL"; //TODO: what is this
                    
                    currentVisit.visit_id=visitJSON[0]["visit_id"]as! String;
                    currentVisit.tag=visitJSON[0]["tag"]as! String;
                    var triagesURL: String = "http://ehr-api.herokuapp.com/v2/triages?visit_id=\(currentVisit.visit_id)";
                    Alamofire.request(.GET, visitsURL, parameters: nil, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
                        if let visitJSON = Response.result.value{
//                            triage_id=
//                            if let y = visitJSON[""] as? String{
//                                p1.natvie_name = y;
//                            }
                print(visitJSON[0]["visit_id"]as! String);
                        }
                    }
                }
//                print(visitJSON["visit_id"] as? Int);
            }
        }
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
        
        if(1==1){
            self.performSegueWithIdentifier("Login_MainMenu", sender: self);
        }
        else{};
    }
    
}

