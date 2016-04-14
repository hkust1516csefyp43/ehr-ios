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
    
    @IBOutlet weak var inputbox: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //        UsernameTextField.tag=1;
        //        self.view.viewWithTag(1)?.hidden = true;
        UsernameTextField.text=nil;
        PasswordTextField.text=nil;
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
    func textViewDidChange(textView: UITextView) {
        print(inputbox.text); //the textView parameter is the textView where text was changed
    }
}

