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

class AddVisitViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func NewPatientOnclick(sender: UIButton) {
        AddVisitState=0;
        //Call Next View Controller
        let triagemodifyViewController = storyboard?.instantiateViewControllerWithIdentifier("TriageModifyViewController") as! TriageModifyViewController;
        navigationController?.pushViewController(triagemodifyViewController, animated: true);
    }
    
    @IBAction func ExistingPatientOnclick(sender: UIButton) {
        patientList2.removeAll();
        let headers = [
            "token": token,
        ]
        var URL2: String = "\(Path)patients?clinic_id=\(CurrentClinic)";
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
                    p1.getFirstName();
                    
                    patientList2.append(p1);
                }
                AddVisitState=1;
                //Navigate to next controller
                self.performSegueWithIdentifier("AddVisit_ExistingPatient", sender: self);
            }
            else{
                print("Error: Cannot get PatientList");
            }
        }
    }
    
    @IBAction func BackOnclick(sender: UIButton) {
              self.navigationController?.popViewControllerAnimated(true);
    }

}