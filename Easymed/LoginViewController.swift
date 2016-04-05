//
//  ViewController.swift
//  Easymed
//
//  Created by choi chun ho,chchoiac,20124979 on 1/4/16.
//  Copyright © 2016 John. All rights reserved.
//

import UIKit;
import Alamofire;

var patientList1 : [Patient] = [Patient]();
var patientList2 : [Patient] = [Patient]();
var currentVisit: Visit = Visit();
var currentPatient : Patient = Patient();
var tempPatient: Patient = Patient();
var TriageModifyViewControllerState = -1; //-1= default, 0= new patient + add visit, 1= old patient + add visit, 2= old patient + modify visit
var FT_ITS_State = -1; //-1= default, 0=Finished Triage Onclick, 1=In this clinic Onclick
var AddVisitState = -1; //-1=default, 0=new PATIENT+ new VISIT, 1=existing PATIENT + new VISIT, 2=edit VISIT
var this_clinic_id : String = "3";
var signal : Int = -1; // -1= error, 1=ThisSlumPatient, 2=Finished Slum
var token : String = "1";
var next_stage : String = "-1"; // -1= error, 1=triage, 2=consultation,

class LoginViewController: UIViewController {
    
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UsernameTextField.text=nil;
        PasswordTextField.text=nil;
        // Do any additional setup after loading the view, typically from a nib.
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

