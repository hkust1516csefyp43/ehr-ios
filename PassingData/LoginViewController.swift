//
//  ViewController.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//
import Foundation;
import UIKit


var patientList : [patient] = [patient]();
//Todo: change allPatientList array to Patient object array
var PatientName = ["Patient A","Patient B","Patient C","Patient D","Patient E"];

class LoginViewController: UIViewController {

    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var NameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var p1:patient = patient();
        var p2:patient = patient();
        var p3:patient = patient();
        var p4:patient = patient();
        var p5:patient = patient();
        p1.test_setup("Albert", gender: "m", lastSeen: 1 ,dateOfBirth: 21);
        p2.test_setup("Bob", gender: "m", lastSeen: 2 ,dateOfBirth: 22);
        p3.test_setup("Cathy", gender: "f", lastSeen: 3 ,dateOfBirth: 23);
        p4.test_setup("Dick", gender: "m", lastSeen: 4 ,dateOfBirth: 24);
        p5.test_setup("Eason", gender: "m", lastSeen: 5 ,dateOfBirth: 25);
        patientList.append(p1);
        patientList.append(p2);
        patientList.append(p3);
        patientList.append(p4);
        patientList.append(p5);
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

