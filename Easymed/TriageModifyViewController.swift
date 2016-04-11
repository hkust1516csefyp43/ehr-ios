//
//  ViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit
import PagingMenuController
import Alamofire

class TriageModifyViewController: UIViewController, PagingMenuControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        //Copy currentPatient data to Temp, so all temp patient modify will save at there
        if(AddVisitState==0){ //new patient
            currentVisit = Visit();
        }
        else if(AddVisitState==1){ //existing patient
            //        currentVisit.patient.clonePatient(currentPatient);
        }
        else if(AddVisitState==2){//edit visitng
            
        }
        else{
            print("error: Variable 'AddVisitState'")
        }
        //Add sliding page+button
        let personaldataViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PersonalDataViewController") as! PersonalDataViewController;
        let vitalsignsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("VitalSignsViewController") as! VitalSignsViewController;
        let chiefcomplainViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ChiefComplainViewController") as! ChiefComplainViewController;
        let remarkViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RemarkViewController") as! RemarkViewController;
        
        //        let hpiViewController = self.storyboard?.instantiateViewControllerWithIdentifier("HPIViewController") as! HPIViewController;
        //        let previousmedicalhistoryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PreviousMedicalHistoryViewController") as! PreviousMedicalHistoryViewController;
        //        let familyhistoryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("FamilyHistoryViewController") as! FamilyHistoryViewController;
        //        let socialhistoryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SocialHistoryViewController") as! SocialHistoryViewController;
        //        let drughistoryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DrugHistoryViewController") as! DrugHistoryViewController;
        //        let screeningViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ScreeningViewController") as! ScreeningViewController;
        //        let allergyViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AllergyViewController") as! AllergyViewController;
        //        let pregnancyViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PregnancyViewController") as! PregnancyViewController;
        //        let reviewofthesystemViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ReviewOfTheSystemViewController") as! ReviewOfTheSystemViewController;
        
        //Finishted Triage Case
        let triagemodifyFTViewController = [personaldataViewController,vitalsignsViewController,chiefcomplainViewController,remarkViewController];
        //        let triagemodifyFTViewController = [personaldataViewController,chiefcomplainViewController,remarkViewController];
        let options = PagingMenuOptions()
        options.menuHeight = 30
        
        let pagingmenuController = self.childViewControllers.first as! PagingMenuController
        pagingmenuController.delegate = self;
        pagingmenuController.setup(viewControllers: triagemodifyFTViewController, options: options)
        
        //Add navigationbar button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Confirm", style: .Plain, target: self, action:"SaveButtonOnclick:")
    }
    
    
    func SaveButtonOnclick(sender: UIBarButtonItem) {
        if(AddVisitState==0){
            AddVisitState = -1;
            // POST patients
            let patientsjson : [String: AnyObject] = [
                "honorific":currentVisit.patient.honorific,
                "first_name": currentVisit.patient.first_name,
                "middle_name":currentVisit.patient.middle_name,
                "last_name": currentVisit.patient.last_name,
                "address":currentVisit.patient.address,
                "email":currentVisit.patient.email,
                //ref
                "clinic_id": this_clinic_id,
                //ref
                "gender_id": "caw23232",
                "birth_year":currentVisit.patient.birth_year,
                "birth_month":currentVisit.patient.birth_month,
                "birth_date":currentVisit.patient.birth_date,
                //ref value
//                "blood_type_id":currentVisit.patient.blood_type_id,
                //ref value
                "phone_number_country_code":"2",
                "phone_number":currentVisit.patient.phone_number_country_code,
                "native_name":currentVisit.patient.natvie_name
            ];
            
            let patientsheaders = [
                "token": token,
                "Content-Type": "application/json"
            ];
            let patientsURL: String = "http://ehr-testing.herokuapp.com/v2/patients";
            print("POST: \(patientsURL)");
            Alamofire.request(.POST, patientsURL, parameters: patientsjson, encoding: .JSON, headers: patientsheaders).responseJSON { (Response) -> Void in
                if let patientsJSON = Response.result.value{
                    
                    
                    // POST visits
                    let visitsjson : [String: AnyObject] = [
                        "patient_id": patientsJSON["patient_id"] as! String,
                        "tag": tag,
                        "next_station": currentVisit.next_station
                    ];
                    let visitsheaders = [
                        "token": token,
                        "Content-Type": "application/json"
                    ];
                    let visitsURL: String = "http://ehr-testing.herokuapp.com/v2/visits";
                    print("POST: \(visitsURL)");
                    Alamofire.request(.POST, visitsURL, parameters: visitsjson, encoding: .JSON, headers: visitsheaders).responseJSON { (Response) -> Void in
                        if let visitsJSON = Response.result.value{
                            
                            print(currentVisit.triage.systolic)
                            print(currentVisit.triage.diastolic)
                            // POST triages
                            let triagesjson : [String: AnyObject] = [
                                "visit_id": visitsJSON["visit_id"] as! String,
                                "user_id": userID,
                                "systolic": Int(currentVisit.triage.systolic)!,
                                "diastolic": Int(currentVisit.triage.diastolic)!,
                                "heart_rate": Int(currentVisit.triage.heartRate)!,
                                "respiratory_rate": Int(currentVisit.triage.respiratoryRate)!,
                                "weight":Int(currentVisit.triage.weight)!,
//                                "height":Int(currentVisit.triage.height)!,
                                "temperature":Int(currentVisit.triage.temperature)!,
                                "spo2":Int(currentVisit.triage.spo2)!,
//                               "last_deworming_tablet":currentVisit.triage.lastDewormingTablet,
                                //                                "chief_complains":currentVisit.triage.chiefComplains,
                                //                                "remark":currentVisit.triage.remark,
                                "start_timestamp":startTimeStamp,
                                "end_timestamp":visitsJSON["create_timestamp"] as! String,
                                //                                "edited_in_consultation":"FALSE",
                                //                                "head_circumference":currentVisit.triage.headCircumference
                            ];
                            let triagesheaders = [
                                "token": token,
                                "Content-Type": "application/json"
                            ];
                            let triagesURL: String = "http://ehr-testing.herokuapp.com/v2/triages";
                            print("POST: \(triagesURL)");
                            Alamofire.request(.POST, triagesURL, parameters: triagesjson, encoding: .JSON, headers: triagesheaders).responseJSON { (Response) -> Void in
                                if let triagesJSON = Response.result.value{
                                    print(triagesJSON);
                                    //Call Next View Controller
                                    let nextController = self.storyboard?.instantiateViewControllerWithIdentifier("PendingViewController") as! PendingViewController;
                                    self.navigationController?.pushViewController(nextController, animated: true);
                                }
                            }
                        }
                    }
                }
            }
        }
        //        currentPatient.Compare(tempPatient);
        //        currentPatient.getInformation();
        //        currentVisit.patient.getInformation();
    }
    
    func willMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
        
    }
    
    func didMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
        
    }
}

