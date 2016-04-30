//
//  File.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20121979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation;
import UIKit;
import Alamofire;

class PharmacyModifyViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var PharmacyTableView: UITableView!
    @IBOutlet weak var BackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    //    override func viewWillAppear(animated: Bool) {
    //        self.PharmacyTableView.reloadData();
    //    }
    
    //Assign number of patient in Table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prescriptionsList.count;
    }
    
    
    //Assign content in cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=self.PharmacyTableView.dequeueReusableCellWithIdentifier("Cell_Pharmacy", forIndexPath: indexPath) as! Cell_Pharmacy;
        
        print("Title: \(prescriptionsList[indexPath.row].medication_id)")
        print("Detail: \(prescriptionsList[indexPath.row].prescription_detail)")
        print("decision: \(prescriptionsList[indexPath.row].pharmacy_decision)")
        
        if(prescriptionsList[indexPath.row].pharmacy_decision == 1){
            cell.Switch.text = "Y";
        }
        else{
            cell.Switch.text = "N";
        }
        
        for(var i=0; i<medicationsList.count;i++){
            if(prescriptionsList[indexPath.row].medication_id == medicationsList[i].medication_id){
                cell.Title.text = medicationsList[i].medication;
                break;
            }
        }
        
        if(cell.Desc.text == "NULL"){
            "No descripsion, ask consultation's doctors for further enquiry."
        }
        else{
            cell.Desc.text = "Descripsion: \(prescriptionsList[indexPath.row].prescription_detail)";
        }
        
        return cell;
    }
    
    //Onclick Cell Action
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(prescriptionsList[indexPath.row].pharmacy_decision == 0){
            prescriptionsList[indexPath.row].pharmacy_decision=1;
            print( "original:\(prescriptionsList_original[indexPath.row].pharmacy_decision) , new:\(prescriptionsList[indexPath.row].pharmacy_decision)")
        }
        else{
            prescriptionsList[indexPath.row].pharmacy_decision=0;
            print( "original:\(prescriptionsList_original[indexPath.row].pharmacy_decision) , new:\(prescriptionsList[indexPath.row].pharmacy_decision)")
        }
        self.PharmacyTableView.reloadData();
    }
    
    @IBAction func BackOnclick(sender: UIButton) {
        //Call Next View Controller
        // simulate_click=2;
        //        let nextController = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuViewController") as! MainMenuViewController;
        //        self.navigationController?.pushViewController(nextController, animated: true);
        var backEndFinish = false;
        patientList1.removeAll();
        patientList2.removeAll();
        let headers = [
            "token": token,
        ]
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
                if(backEndFinish==true){
                    let nextController = self.storyboard?.instantiateViewControllerWithIdentifier("PharmacyListViewController") as! PharmacyListViewController;
                    self.navigationController?.pushViewController(nextController, animated: true);
                }
                else{
                    backEndFinish=true
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
                if(backEndFinish==true){
                    let nextController = self.storyboard?.instantiateViewControllerWithIdentifier("PharmacyListViewController") as! PharmacyListViewController;
                    self.navigationController?.pushViewController(nextController, animated: true);
                }
                else{
                    backEndFinish=true
                }
            }
            else{
                print("Error: Cannot get PatientList");
            }
        }
    }
    
    
    @IBAction func SaveOnclick(sender: UIButton) {
        simulate_click = 2;
        edit_visit = 1;
        var navigated = 0;
        var prescriptions_update = 0;
        var prescriptionsList_update:[prescriptions]=[prescriptions]();
        for(var i = 0 ; i<prescriptionsList_original.count ; i++){
            if(prescriptionsList_original[i].compare_prescription_decision(prescriptionsList[i])==1){
                prescriptionsList_update.append(prescriptionsList[i]);
                prescriptions_update = 1;
            }
        }
        //PUT visit
        let visitsjson : [String: AnyObject] = [
            "next_station" : 1,
        ];
        
        let visitsheaders = [
            "token": token,
            "Content-Type": "application/json"
        ];
        let patientsURL: String = "\(Path)visits/\(currentVisit.visit_id)";
        print("PUT: \(patientsURL)");
        Alamofire.request(.PUT, patientsURL, parameters: visitsjson, encoding: .JSON, headers: visitsheaders).responseJSON { (Response) -> Void in
            if let visitsJSON = Response.result.value{
                print("Success: PUT visit tuple");
                edit_visit=0;
                if(edit_visit==0 && edit_prescription==0 && navigated==0){
                    navigated=1;
                    self.BackOnclick(self.BackButton);
                }
            }
            else{
                print("Fail: PUT visits tuple");
            }
        }
        
        //PUT prescription
        if(prescriptions_update == 1){
            //PUT prescription
            var count_update=0;
            //POST prescripsion
            for (var i=0 ; i<prescriptionsList_update.count ; i++){
//                print("---------------------- original:\(prescriptionsList_original[i].pharmacy_decision) , new:\(prescriptionsList_update[i].pharmacy_decision) ----------------------")
                count_update=count_update+1;
                let prescriptionsjson : [String: AnyObject] = [
                    "prescribed": prescriptionsList_update[i].pharmacy_decision,
                ];
                let prescriptionsheaders = [
                    "token": token,
                    "Content-Type": "application/json"
                ];
                let prescriptionsURL: String = "\(Path)prescriptions/\(prescriptionsList_update[i].prescription_id)";
                print("PUT: \(prescriptionsURL)");
                Alamofire.request(.PUT, prescriptionsURL, parameters: prescriptionsjson, encoding: .JSON, headers: prescriptionsheaders).responseJSON { (Response) -> Void in
                    if let prescriptionsJSON = Response.result.value{
                        if(count_update>=prescriptionsList_update.count){
                            prescriptions_update = 0;
                            if(edit_visit==0 && edit_prescription==0 && navigated==0){
                                //Navigate to next controller
//                                simulate_click = 1;
                                //                                let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuViewController") as! MainMenuViewController;
                                //                                self.navigationController?.pushViewController(nextViewController, animated: true);
                                self.BackOnclick(self.BackButton);
                            }
                        }
                    }
                    else{
                        print("FAIL: PUT prescriptions tuple")
                    }
                }
            }
        }
    }
    
    
}