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
        VerticalScrollView.contentSize.height=1100;
        if(AddVisitState==1||AddVisitState==2){
            //step1: Set text
            edit_patient = 0;
            edit_triage = 0;
            LastName.text=currentVisit.patient.last_name;
            FirstName.text=currentVisit.patient.first_name;
            switch(currentVisit.patient.gender_id){
            case "0":
                Gender.text="Male";
            case "1":
                Gender.text="Female";
            case "2":
                Gender.text="Custom";
            default:
                Gender.text="Undisclosed";
            }
            Birthday.text="\(currentVisit.patient.birth_date) / \(currentVisit.patient.birth_month) / \(currentVisit.patient.birth_year)"
            Address.text=currentVisit.patient.address;
            PhoneNumber.text=String(currentVisit.patient.phone_number);
        }
        else if(AddVisitState==0){
        Gender.text = "Undisclosed";
        Birthday.text = "dd/mm/yyyy"
        }
        else{
            print("error: variable 'AddVisitState'");
        }
    }
    @IBAction func FirstNameOnChange(sender: UITextField) {
        currentVisit.patient.first_name=String!(FirstName.text);
        edit_patient=1;
    }

    @IBAction func LsstNameOnChange(sender: UITextField) {
        currentVisit.patient.last_name=String!(LastName.text);
        edit_patient=1;
    }
    
    @IBAction func AddressOnChange(sender: UITextField) {
        currentVisit.patient.address=String!(Address.text);
        edit_patient=1;
    }
    
    @IBAction func PhoneNumberOnChange(sender: UITextField) {
        currentVisit.patient.phone_number=String!(PhoneNumber.text);
        edit_patient=1;
    }

}