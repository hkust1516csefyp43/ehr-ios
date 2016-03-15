//
//  ViewController.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//
import Foundation;
import UIKit


var patientList : [Patient] = [Patient]();
var this_clinic_id : String = "3";
var signal : Int = -1; // -1= error, 1=ThisSlumPatient, 2=Finished Slum
var token : String = "1";
var next_stage : String = "-1"; // -1= error, 1=triage, 2=consultation, 
//Todo: change allPatientList array to Patient object array
var PatientName = ["Patient A","Patient B","Patient C","Patient D","Patient E"];

class LoginViewController: UIViewController {

    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var NameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        Alamofire library add backend library
//        Alamofire.request(.GET, "https://ehr-api.herokuapp.com/v1/patient/?token=hihi").responseJSON { (Response) -> Void in
//            if let JSON = Response.result.value{
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let mainMenuViewController: MainMenuViewController = segue.destinationViewController as!MainMenuViewController;
        mainMenuViewController.LabelText = NameTextField.text!;
    }
    
    
    @IBAction func LoginButtonOnclick(sender: AnyObject) {
        //TODO: add logic check
        if(1==1){
            self.performSegueWithIdentifier("LoginToMainMenuSegue", sender: self);
        }
    }
    

}

