//
//  TriageMenuViewController.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 9/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation
import UIKit;
import Alamofire;

class AfterPharmacyViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var AfterPharmacyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    //Assign number of patient in TriageFT Table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientList2.count;
    }
    
    //Assign content in cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
                
        let date = NSDate();
        let calendar = NSCalendar.currentCalendar();
        let components = calendar.components([.Day , .Month , .Year], fromDate: date);
        let year =  components.year;
        let month =  components.month;
        var year_age:Int = Int(year)-patientList2[indexPath.row].birth_year;
        var month_age:Int;
        var age_text:String="";
        var gender_text:String = "Other";
        var firstname_text:String=""
        var middlename_text:String=""
        var lastname_text:String=""
        let cell=self.AfterPharmacyTableView.dequeueReusableCellWithIdentifier("Cell_AfterPharmacy", forIndexPath: indexPath) as! Cell_AfterPharmacy;
        
        if(patientList2[indexPath.row].last_name != "NULL"){
            lastname_text=patientList2[indexPath.row].last_name
        }
        if(patientList2[indexPath.row].first_name != "NULL"){
            firstname_text=patientList2[indexPath.row].first_name;
        }
        if(patientList2[indexPath.row].middle_name != "NULL"){
            middlename_text=patientList2[indexPath.row].middle_name;
        }
        if(firstname_text == "" && lastname_text == "" && middlename_text == ""){
            cell.NameLabel.text = "UNKNOWN Patient";
        }
        else{
            cell.NameLabel.text="\(firstname_text) \(middlename_text) \(lastname_text)"
        }
        
        if(patientList2[indexPath.row].birth_month > Int(month)){
            month_age = patientList2[indexPath.row].birth_month-Int(month);
        }
        else {
            month_age = 12-Int(month)+patientList2[indexPath.row].birth_month;
            year_age--;
        }
        
        if(patientList2[indexPath.row].gender_id != "NULL" || patientList2[indexPath.row].gender_id != "undisclosed"){
            for(var i=0; i<gendersList.count ; i++){
                if(patientList2[indexPath.row].gender_id==gendersList[i].gender_id){
                    gender_text=gendersList[i].description;
                    break;
                }
            }
        }
        
        if(year_age<=130 && year_age>0){
            age_text="\(year_age) years \(month_age) months old";
        }
        else if(year_age == 0 && month_age>=0){
            age_text="\(month_age) months old"
        }
        else{
            age_text="Undisclosed age"
        }
        
        if(patientList2[indexPath.row].natvie_name != "NULL"){
            cell.NativeNameLabel.text="\(patientList2[indexPath.row].natvie_name)"
        }
        else{
            cell.NativeNameLabel.text=""
        }
        
        cell.AgeLabel.text="\(gender_text) / \(age_text)"
        return cell;
    }
    
    //Onclick Cell Action
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //Variable
        var got_visit=0;
        var got_consultation=0;
        var got_related_data=0;
        var got_prescriptions=0;
        
        //Copy target data to variable
        currentVisit=Visit();
        currentVisit.clonePatient(patientList2[indexPath.row]);
        
        let headers = [
            "token": token,
        ]
        var visitsURL: String = "http://ehr-api.herokuapp.com/v2/visits?patient_id=\(currentVisit.patient.patient_id)";
        
        Alamofire.request(.GET, visitsURL, parameters: nil, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
            if let visitJSON = Response.result.value{
                if(visitJSON.count > 1){
                    print("FAIL: Get consultations tuple, more than 1 Visits found for patient_id: \(currentVisit.patient.patient_id)");
                }
                else{
                    currentVisit.visit_id=visitJSON[0]["visit_id"]as! String;
                    currentVisit.tag=visitJSON[0]["tag"]as! Int;
                    
                    var triagesURL: String = "http://ehr-api.herokuapp.com/v2/triages?visit_id=\(currentVisit.visit_id)";
                    
                    Alamofire.request(.GET, triagesURL, parameters: nil, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
                        if let triagesJSON = Response.result.value{
                            
                            //manage currentVisit.triage data
                            currentVisit.triage.triage_id=triagesJSON[0]["triage_id"]as! String;
                            currentVisit.triage.user_id = userID;
                            if let y = triagesJSON[0]["systolic"]as? Int{
                                currentVisit.triage.systolic = String(y);
                            }
                            if let y = triagesJSON[0]["diastolic"]as? Int{
                                currentVisit.triage.diastolic = String(y);
                            }
                            if let y = triagesJSON[0]["heart_rate"]as? Int{
                                currentVisit.triage.heartRate = String(y);
                            }
                            if let y = triagesJSON[0]["respiratory_rate"]as? Int{
                                currentVisit.triage.respiratoryRate = String(y);
                            }
                            if let y = triagesJSON[0]["weight"]as? Int{
                                currentVisit.triage.weight = String(y);
                            }
                            if let y = triagesJSON[0]["height"]as? Int{
                                currentVisit.triage.height = String(y);
                            }
                            if let y = triagesJSON[0]["temperature"]as? Int{
                                currentVisit.triage.temperature = String(y);
                            }
                            if let y = triagesJSON[0]["spo2"]as? Int{
                                currentVisit.triage.spo2 = String(y);
                            }
                            if let y = triagesJSON[0]["head_circumference"]as? Int{
                                currentVisit.triage.headCircumference = String(y);
                            }
                            //                    var lastDewormingTablet: String = "NULL";
                            if let y = triagesJSON[0]["chief_complains"]as? String{
                                currentVisit.triage.chiefComplains = y;
                            }
                            if let y = triagesJSON[0]["remark"]as? String{
                                currentVisit.triage.remark = y;
                            }
                            //                    var editedInConsultation :String = "NULL";
                            
                            got_visit=1;
                            if(got_consultation==1 && got_visit==1 && got_prescriptions==1 && got_related_data==1){
                                //Navigate to next controller
                                //state changes
                                AddVisitState=2;
                                ConsultationState = 1;
                                let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PharmacyModifyViewController") as! PharmacyModifyViewController;
                                self.navigationController?.pushViewController(nextViewController, animated: true);
                            }
                        }
                        else{
                            print("Fail: GET triages tuple")
                        }
                    }
                    var consultationsURL: String = "http://ehr-api.herokuapp.com/v2/consultations?visit_id=\(currentVisit.visit_id)";
                    
                    Alamofire.request(.GET, consultationsURL, parameters: nil, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
                        if let consultationsJSON = Response.result.value{
                            if(consultationsJSON.count>1){
                                print("Fail: Get consultations tuple, more than 1 consultations found for visit_id: \(currentVisit.visit_id)")
                            }
                            else{
                                got_consultation=1;
                                
                                currentVisit.consultation.consultation_id=consultationsJSON[0]["consultation_id"]as! String;
                                
                                //consultation_remark
                                if let y = consultationsJSON[0]["remark"]as? String{
                                    currentVisit.consultation.remark = y;
                                }
                                
                                // review_of_system
                                if let y = consultationsJSON[0]["ros_ga"]as? String{
                                    currentVisit.consultation.ros_ga = y;
                                }
                                if let y = consultationsJSON[0]["ros_respi"]as? String{
                                    currentVisit.consultation.ros_respi = y;
                                }
                                if let y = consultationsJSON[0]["ros_cardio"]as? String{
                                    currentVisit.consultation.ros_cardio = y;
                                }
                                if let y = consultationsJSON[0]["ros_gastro"]as? String{
                                    currentVisit.consultation.ros_gastro = y;
                                }
                                if let y = consultationsJSON[0]["ros_genital"]as? String{
                                    currentVisit.consultation.ros_genital = y;
                                }
                                if let y = consultationsJSON[0]["ros_ent"]as? String{
                                    currentVisit.consultation.ros_ent = y;
                                }
                                if let y = consultationsJSON[0]["ros_skin"]as? String{
                                    currentVisit.consultation.ros_skin = y;
                                }
                                if let y = consultationsJSON[0]["ros_other"]as? String{
                                    currentVisit.consultation.ros_other = y;
                                }
                                
                                //pregnancy
                                if let y = consultationsJSON[0]["preg_lmp"]as? String{
                                    currentVisit.consultation.preg_lmp = y;
                                }
                                if let y = consultationsJSON[0]["preg_curr_preg"]as? String{
                                    currentVisit.consultation.preg_curr_preg = y;
                                }
                                if let y = consultationsJSON[0]["preg_gestration"]as? String{
                                    currentVisit.consultation.preg_gestration = y;
                                }
                                if let y = consultationsJSON[0]["preg_breast_feeding"]as? Int{
                                    currentVisit.consultation.preg_breast_feeding = y;
                                }
                                if let y = consultationsJSON[0]["preg_contraceptive"]as? Int{
                                    currentVisit.consultation.preg_contraceptive = y;
                                }
                                if let y = consultationsJSON[0]["preg_num_preg"]as? String{
                                    currentVisit.consultation.preg_num_preg = y;
                                }
                                if let y = consultationsJSON[0]["preg_num_live_birth"]as? String{
                                    currentVisit.consultation.preg_num_live_birth = y;
                                }
                                if let y = consultationsJSON[0]["preg_num_miscarriage"]as? String{
                                    currentVisit.consultation.preg_num_miscarriage = y;
                                }
                                if let y = consultationsJSON[0]["preg_num_abortion"]as? String{
                                    currentVisit.consultation.preg_num_abourtion = y;
                                }
                                if let y = consultationsJSON[0]["preg_num_still_birth"]as? String{
                                    currentVisit.consultation.preg_num_still_birth = y;
                                }
                                if let y = consultationsJSON[0]["preg_remark"]as? String{
                                    currentVisit.consultation.preg_remark = y;
                                }
                                
                                //physical examination
                                if let y = consultationsJSON[0]["pe_general"]as? String{
                                    currentVisit.consultation.pe_general = y;
                                }
                                if let y = consultationsJSON[0]["pe_respiratory"]as? String{
                                    currentVisit.consultation.pe_respiratory = y;
                                }
                                if let y = consultationsJSON[0]["pe_cardio"]as? String{
                                    currentVisit.consultation.pe_cardio = y;
                                }
                                if let y = consultationsJSON[0]["pe_gastro"]as? String{
                                    currentVisit.consultation.pe_gastro = y;
                                }
                                if let y = consultationsJSON[0]["pe_genital"]as? String{
                                    currentVisit.consultation.pe_genital = y;
                                }
                                if let y = consultationsJSON[0]["pe_ent"]as? String{
                                    currentVisit.consultation.pe_ent = y;
                                }
                                if let y = consultationsJSON[0]["pe_skin"]as? String{
                                    currentVisit.consultation.pe_skin = y;
                                }
                                if let y = consultationsJSON[0]["pe_other"]as? String{
                                    currentVisit.consultation.pe_other = y;
                                }
                                
                                //red flag
                                if let y = consultationsJSON[0]["rf_alertness"]as? String{
                                    currentVisit.consultation.rf_alertness = y;
                                }
                                if let y = consultationsJSON[0]["rf_breathing"]as? String{
                                    currentVisit.consultation.rf_breathing = y;
                                }
                                if let y = consultationsJSON[0]["rf_circulation"]as? String{
                                    currentVisit.consultation.rf_circulation = y;
                                }
                                if let y = consultationsJSON[0]["rf_dehydration"]as? String{
                                    currentVisit.consultation.rf_dehydration = y;
                                }
                                if let y = consultationsJSON[0]["rf_defg"]as? String{
                                    currentVisit.consultation.rf_defg = y;
                                }
                                
                                //Get prescriptions
                                let prescriptionsURL: String = "http://ehr-api.herokuapp.com/v2/prescriptions?consultation_id=\(currentVisit.consultation.consultation_id)";
                                print("GET: \(prescriptionsURL)");
                                Alamofire.request(.GET, prescriptionsURL, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
                                    if let prescriptionsJSON = Response.result.value{
                                        prescriptionsList_original.removeAll();
                                        prescriptionsList.removeAll();
                                        for(var i=0 ; i<prescriptionsJSON.count ; i++){
                                            var obj: prescriptions = prescriptions();
                                            var obj2: prescriptions = prescriptions();
                                            if let y = prescriptionsJSON[i]["prescription_id"]as? String{
                                                obj.prescription_id = y;
                                                obj2.prescription_id = y;
                                            }
                                            if let y = prescriptionsJSON[i]["medication_id"]as? String{
                                                obj.medication_id = y;
                                                obj2.medication_id = y;

                                            }
                                            if let y = prescriptionsJSON[i]["prescription_detail"]as? String{
                                                obj.prescription_detail = y;
                                                 obj2.prescription_detail = y;
                                            }
                                            if let y = prescriptionsJSON[i]["prescription_detail"]as? String{
                                                obj.prescription_detail = y;
                                                obj2.prescription_detail = y;
                                            }
                                            if let y = prescriptionsJSON[i]["prescribed"]as? Int{
                                                obj.prescribed = y;
                                                if(obj.prescribed == 1){
                                                    obj.pharmacy_decision = 1;
                                                    obj2.pharmacy_decision = 1;

                                                }
                                                else{
                                                    obj.pharmacy_decision = 0;
                                                    obj2.pharmacy_decision = 0;
                                                }
                                            }
                                            prescriptionsList_original.append(obj);
                                            prescriptionsList.append(obj2);
                                        }
                                        
                                        got_prescriptions=1;
                                        if(got_consultation==1 && got_visit==1 && got_prescriptions==1 && got_related_data==1){
                                            //Navigate to next controller
                                            //state changes
                                            AddVisitState=2;
                                            ConsultationState = 1;
                                            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PharmacyModifyViewController") as! PharmacyModifyViewController;
                                            self.navigationController?.pushViewController(nextViewController, animated: true);
                                        }
                                    }
                                    else{
                                        print("FAIL: GET prescriptions table with consultation_id:\(currentVisit.consultation.consultation_id)")
                                    }
                                }
                                
                                //Get related_data
                                var relatedDataURL: String = "http://ehr-api.herokuapp.com/v2/related_data?consultation_id=\(currentVisit.consultation.consultation_id)";
                                
                                Alamofire.request(.GET, relatedDataURL, parameters: nil, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
                                    if let relatedDataJSON = Response.result.value{
                                        related_dataList.removeAll();
                                        for(var i=0 ; i<relatedDataJSON.count ; i++){
                                            var obj:related_data = related_data();
                                            if let y = relatedDataJSON[i]["rd_id"]as? String{
                                                obj.rd_id=y;
                                            }
                                            if let y = relatedDataJSON[i]["consultation_id"]as? String{
                                                obj.consultation_id=y;
                                            }
                                            if let y = relatedDataJSON[i]["data"]as? String{
                                                obj.data=y;
                                            }
                                            if let y = relatedDataJSON[i]["remark"]as? String{
                                                obj.remark=y;
                                            }
                                            if let y = relatedDataJSON[i]["category"]as? Int{
                                                obj.category=y;
                                            }
                                            related_dataList.append(obj);
                                        }
                                        got_related_data=1;
                                        if(got_consultation==1 && got_visit==1 && got_prescriptions==1 && got_related_data==1){
                                            //Navigate to next controller
                                            //state changes
                                            AddVisitState=2;
                                            ConsultationState = 1;
                                            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PharmacyModifyViewController") as! PharmacyModifyViewController;
                                            self.navigationController?.pushViewController(nextViewController, animated: true);
                                        }
                                    }
                                    else{
                                        print("FAIL: GET related_data tuple with consultation_id:\(currentVisit.consultation.consultation_id)")
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
}