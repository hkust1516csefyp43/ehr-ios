//
//  ViewController.swift
//  Easymed
//
//  Created by choi chun ho,chchoiac,20124979 on 1/4/16.
//  Copyright © 2016 John. All rights reserved.
//

import UIKit;
import Alamofire;

//Save variable
var edit_attachments = 0;
var edit_patient = 0;
var edit_triage = 0;
var edit_consultation = 0;
var edit_visit = 0;
var edit_related_data = 0;
var edit_prescription = 0;

var new_related_data = 0;
var modified_related_data = 0;
var deleted_related_data = 0;
var simulate_click = 0;
var related_dataState = -1; //-1 = error, 0 = new, 1=modify
var related_data_type = -1; //1=screening, 2=Allergy, 3=diagnosis, 4=advice, 5=follow-up
var related_data_id_count = 0;
//
var patientList1 : [Patient] = [Patient]();
var patientList2 : [Patient] = [Patient]();
var currentVisit: Visit = Visit();
var currentRelatedData: related_data = related_data();
var currentPrescription: prescriptions = prescriptions();
var currentPatient : Patient = Patient();
var currentAttachments : attachments = attachments();
var tempPatient: Patient = Patient();
var TriageModifyViewControllerState = -1; //-1= default, 0= new patient + add visit, 1= old patient + add visit, 2= old patient + modify visit
var FT_ITS_State = -1; //-1= default, 0=Finished Triage Onclick, 1=In this clinic Onclick
//AddVisitViewController,TriageModifyViewController
var AddVisitState = -1; //-1=default, 0=new PATIENT+ new VISIT, 1=existing PATIENT + new VISIT, 2=edit VISIT
var ConsultationState = -1; //-1=error, 0=waitlist Consultation(add consultation), 1=finished Consultation(modify consultation)
var PharmacyState = -1; //-1=error, 0=waitlist Pharmacy(modify prescripsion), 1=finished Pharmacy (modify prescripsion)

var this_clinic_id : String = "3";
var PendingSignal : Int = -1; // -1= error, 1=ThisSlumPatient, 2=Finished Slum
var token : String = "1";
var next_stage : String = "-1"; // -1= error, 1=triage, 2=consultation,
//visits
var tag: String = "1";
//triages
var userID: String = "acwaeoiwlin";
var edited_in_consultation: String = "FALSE";
var startTimeStamp: String = "1994-04-07 21:09:31.481+00";

//related_data storage
var clinicsList:[Clinics] = [Clinics]();
var clinicsNameList:[[String]] = [[String]]();
var related_dataList:[related_data] = [related_data]();
var new_related_dataList:[related_data] = [related_data]();
var modified_related_dataList:[related_data] = [related_data]();
var deleted_related_dataList:[related_data] = [related_data]();
var keywordsList:[keywords] = [keywords]();
var medicationsList:[medications] = [medications]();
var gendersList:[genders] = [genders]();
var prescriptionsList: [prescriptions] = [prescriptions]();
var prescriptionsList_original: [prescriptions] = [prescriptions]();
var attachmentsList:[attachments] = [attachments]();

class LaunchAppViewController: UIViewController {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVar();
        
        //UI
        self.icon.image = UIImage(named: "easymed");
        loading.startAnimating();
        
        //Data
        // load header
        let headers = [
            "token": token,
        ];
        let URL: String = "http://ehr-api.herokuapp.com/v2/clinics";
        print("GET: \(URL)");
        Alamofire.request(.GET, URL, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
            if let JSON = Response.result.value{
                clinicsList.removeAll();
                var tempList:[String]=[String]();
                for(var i=0 ; i<JSON.count ; i++){
                    var obj:Clinics = Clinics();
                    
                    if let y = JSON[i]["clinic_id"] as? String{
                        obj.clinic_id = y;
                    }
                    if let y = JSON[i]["country_id"] as? String{
                        obj.country_id = y;
                    }
                    if let y = JSON[i]["is_active"] as? Int{
                        obj.is_active = y;
                    }
                    if let y = JSON[i]["english_name"] as? String{
                        obj.english_name = y;
                    }
                    if let y = JSON[i]["native_name"] as? String{
                        obj.native_name = y;
                    }
                    if let y = JSON[i]["latitude"] as? Double{
                        obj.latitude = y;
                    }
                    if let y = JSON[i]["longitude"] as? Double{
                        obj.longitude = y;
                    }
                    
                    if let y = JSON[i]["remark"] as? String{
                        obj.remark = y;
                    }
                    if let y = JSON[i]["is_global"] as? Int{
                        obj.is_global = y;
                    }
                    if let y = JSON[i]["suitcase_id"] as? String{
                        obj.suitcase_id = y;
                    }
                    clinicsList.append(obj);
                    if(obj.native_name != "NULL"){
                        tempList.append("\(obj.english_name) (\(obj.native_name))")
                    }
                    else{
                        tempList.append("\(obj.english_name)")
                    }
                    //Todo word sort ascending order?
                }
                clinicsNameList.append(tempList)
                self.performSegueWithIdentifier("Launch_Login", sender: self);
            }
            else{
                print("Fail: Get clinics tuple");
            }
        }
    }
    
    func initializeVar (){
        //Save iable
        edit_attachments = 0;
        edit_patient = 0;
        edit_triage = 0;
        edit_consultation = 0;
        edit_visit = 0;
        edit_related_data = 0;
        edit_prescription = 0;
        
        new_related_data = 0;
        modified_related_data = 0;
        deleted_related_data = 0;
        simulate_click = 0;
        related_dataState = -1; //-1 = error, 0 = new, 1=modify
        related_data_type = -1; //1=screening, 2=Allergy, 3=diagnosis, 4=advice, 5=follow-up
        related_data_id_count = 0;
        //
        patientList1.removeAll()
        patientList2.removeAll()
        currentVisit = Visit()
        currentRelatedData = related_data();
        currentPrescription = prescriptions();
        currentPatient  = Patient();
        tempPatient = Patient();
        currentAttachments = attachments();
        TriageModifyViewControllerState = -1; //-1= default, 0= new patient + add visit, 1= old patient + add visit, 2= old patient + modify visit
        FT_ITS_State = -1; //-1= default, 0=Finished Triage Onclick, 1=In this clinic Onclick
        //AddVisitViewController,TriageModifyViewController
        AddVisitState = -1; //-1=default, 0=new PATIENT+ new VISIT, 1=existing PATIENT + new VISIT, 2=edit VISIT
        ConsultationState = -1; //-1=error, 0=waitlist Consultation(add consultation), 1=finished Consultation(modify consultation)
        PharmacyState = -1; //-1=error, 0=waitlist Pharmacy(modify prescripsion), 1=finished Pharmacy (modify prescripsion)
        
        this_clinic_id = "3";
        PendingSignal = -1; // -1= error, 1=ThisSlumPatient, 2=Finished Slum
        token = "1";
        next_stage = "-1"; // -1= error, 1=triage, 2=consultation,
        //visits
        tag = "1";
        //triages
        userID = "acwaeoiwlin";
        edited_in_consultation = "FALSE";
        startTimeStamp = "1994-04-07 21:09:31.481+00";
        
        //related_data storage
        clinicsList.removeAll()
        clinicsNameList.removeAll()
        related_dataList.removeAll()
        new_related_dataList.removeAll()
        modified_related_dataList.removeAll()
        deleted_related_dataList.removeAll()
        keywordsList.removeAll()
        medicationsList.removeAll()
        gendersList.removeAll()
        prescriptionsList.removeAll()
        prescriptionsList_original.removeAll()
        attachmentsList.removeAll();
    }
}

