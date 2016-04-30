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

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var NavigationItem: UINavigationItem!
    @IBOutlet weak var ConsultationButton: UIButton!
    @IBOutlet weak var PharmacyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(simulate_click==1){
            simulate_click=0;
            ConsultationOnclick(ConsultationButton);
        }
        if(simulate_click==2){
            simulate_click=0;
            PharmacyOnclick(PharmacyButton);
        }
    }
    
    @IBAction func LogoutOnclick(sender: UIButton) {
        //Navigate to next controller
        let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LaunchAppViewController") as! LaunchAppViewController;
        self.navigationController?.pushViewController(nextViewController, animated: true);
    }
    
    @IBAction func TriageOnclick(sender: UIButton) {
        if(1==1){
            next_stage = "2";
            PendingSignal = 1;
            self.performSegueWithIdentifier("Triage_Pending", sender: self);
        }
    }
    
    @IBAction func ConsultationOnclick(sender: UIButton) {
        var got_p1=0;
        var got_p2=0;
        var got_attachments=0;
        patientList1.removeAll();
        patientList2.removeAll();
        let headers = [
            "token": token,
        ]
        
        let attachmentsURL: String = "\(Path)attachments";
        print("GET: \(attachmentsURL)");
        Alamofire.request(.GET, attachmentsURL, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
            if let JSON = Response.result.value{
                print("SUCCESS: GET attachments tuples");
                for(var i=0; i<JSON.count; i++){
                    var obj:attachments = attachments();
                    if let y = JSON[i]["attachment_id"] as? String{
                        obj.attachment_id = y;
                    }
                    if let y = JSON[i]["cloudinary_url"] as? String{
                        obj.cloudinary_url = y;
                    }
                    if let y = JSON[i]["file_name"] as? String{
                        obj.file_name = y;
                    }
                    if let y = JSON[i]["file_in_base64"] as? String{
                        obj.file_in_base64 = y;
                    }
                    attachmentsList.append(obj);
                }
                if(got_p1==1 && got_p2==1){
                   self.performSegueWithIdentifier("Main_Consultation", sender: self);
                }
                else{
                    got_attachments=1;
                }
            }
            else{
                print("FAIL: GET attachments tuples")
                return;
            }
        }
        
        var URL1: String = "\(Path)patients?clinic_id=\(CurrentClinic)&next_station=2&visit_date=";
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
                if(got_attachments==1 && got_p2==1){
                    self.performSegueWithIdentifier("Main_Consultation", sender: self);
                }
                else{
                    got_p1=1;
                }
            }
            else{
                print("Error: Cannot get PatientList");
                return;
            }
        }
        
        var URL2: String = "\(Path)patients?clinic_id=\(CurrentClinic)&next_station=3";
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
                if(got_attachments==1 && got_p1==1){
                    self.performSegueWithIdentifier("Main_Consultation", sender: self);
                }
                else{
                    got_p2=1;
                }
            }
            else{
                print("Error: Cannot get PatientList");
                return;
            }
        }
    }
    
    @IBAction func PharmacyOnclick(sender: UIButton) {
        var got_p1=0;
        var got_p2=0;
        var got_attachments=0;
        patientList1.removeAll();
        patientList2.removeAll();
        let headers = [
            "token": token,
        ]
        let attachmentsURL: String = "\(Path)attachments";
        print("GET: \(attachmentsURL)");
        Alamofire.request(.GET, attachmentsURL, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
            if let JSON = Response.result.value{
                print("SUCCESS: GET attachments tuples");
                for(var i=0; i<JSON.count; i++){
                    var obj:attachments = attachments();
                    if let y = JSON[i]["attachment_id"] as? String{
                        obj.attachment_id = y;
                    }
                    if let y = JSON[i]["cloudinary_url"] as? String{
                        obj.cloudinary_url = y;
                    }
                    if let y = JSON[i]["file_name"] as? String{
                        obj.file_name = y;
                    }
                    if let y = JSON[i]["file_in_base64"] as? String{
                        obj.file_in_base64 = y;
                    }
                    attachmentsList.append(obj);
                }
                if(got_p1==1 && got_p2==1){
                   self.performSegueWithIdentifier("Main_Pharmacy", sender: self);
                }
                else{
                    got_attachments=1;
                }
            }
            else{
                print("FAIL: GET attachments tuples")
                return;
            }
        }

        var URL1: String = "\(Path)patients?clinic_id=\(CurrentClinic)&next_station=3";
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
                if(got_attachments==1 && got_p2==1){
                    self.performSegueWithIdentifier("Main_Pharmacy", sender: self);
                }
                else{
                    got_p1=1;
                }
            }
            else{
                print("Error: Cannot get PatientList");
            }
        }
        var URL2: String = "\(Path)patients?clinic_id=\(CurrentClinic)&next_station=1";
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
                if(got_attachments==1 && got_p1==1){
                    self.performSegueWithIdentifier("Main_Pharmacy", sender: self);
                }
                else{
                    got_p2=1;
                }
            }
            else{
                print("Error: Cannot get PatientList");
            }
        }
        
    }
}