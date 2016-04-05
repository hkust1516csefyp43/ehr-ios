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

class PersonalDataViewController : UIViewController {
    
    @IBOutlet weak var VerticalScrollView: UIScrollView!
    @IBOutlet weak var PatientPreview: UIImageView!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var Gender: UILabel!
    @IBOutlet weak var Status: UILabel!
    @IBOutlet weak var Birthday: UILabel!
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var PhoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        VerticalScrollView.contentSize.height=850;
        
        if(TriageModifyViewControllerState==2||TriageModifyViewControllerState==1){
            //step1: Set text
            LastName.text=currentPatient.last_name;
            FirstName.text=currentPatient.first_name;
            switch(currentPatient.gender_id){
            case "0":
                Gender.text="Male";
            case "1":
                Gender.text="Female";
            case "2":
                Gender.text="Custom";
            default:
                Gender.text="Undisclosed";
            }
            //        switch(currentPatient.status){
            //        case "0":
            //            Gender.text="male";
            //        case "1":
            //            Gender.text="female";
            //        case "2":
            //            Gender.text="??";
            //        default:
            //            Gender.text="undisclosed";
            //        }
            Birthday.text="\(currentPatient.birth_date) / \(currentPatient.birth_month) / \(currentPatient.birth_year)"
            Address.text=currentPatient.address;
            PhoneNumber.text=String(currentPatient.phone_number);
        }
        else if(TriageModifyViewControllerState==1){
        }
        else{
            print("Signal error:'TriageModifyViewControllerState'")
        }
    }
    
    @IBAction func LastNameOnChange(sender: UITextField) {
        //TASK: check nil
        let trimString = LastName.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            LastName.text="nil"
        }
        tempPatient.last_name=String(LastName.text);
    }
    
    @IBAction func FirstNameOnChange(sender: UITextField) {
        //TASK: check nil
        let trimString = FirstName.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(trimString==""){
            FirstName.text="nil"
        }
        tempPatient.first_name=String(FirstName.text);
    }
    
    @IBAction func AddressOnChange(sender: UITextField) {
        let trimAddress = Address.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        if(String!(trimAddress)==""){
            Address.text="nil";
        }
        tempPatient.address=String(Address.text);
    }
    
    @IBAction func PhoneNumberOnChange(sender: UITextField) {
        //TASK: Only int available
        //TASK: check nil + trim
        tempPatient.phone_number=String(PhoneNumber.text);
    }
}