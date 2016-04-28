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

class TriageFTViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var TriageFTTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    //Assign number of patient in TriageFT Table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientList1.count;
    }
    
    //Assign content in cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let date = NSDate();
        let calendar = NSCalendar.currentCalendar();
        let components = calendar.components([.Day , .Month , .Year], fromDate: date);
        let year =  components.year;
        let month =  components.month;
        var year_age:Int = Int(year)-patientList1[indexPath.row].birth_year;
        var month_age:Int;
        var age_text:String="";
        var gender_text:String = "Other";
        var firstname_text:String=""
        var middlename_text:String=""
        var lastname_text:String=""
        let cell=self.TriageFTTableView.dequeueReusableCellWithIdentifier("CellL_Triage", forIndexPath: indexPath) as! CellL_Triage;
        
        cell.imageDisplay.image = UIImage(named: "defaultPatient");
        if (patientList1[indexPath.row].image_id != "NULL"){
            for(var i=0; i<attachmentsList.count ; i++){
                if(patientList1[indexPath.row].image_id == attachmentsList[i].attachment_id){
                    if(attachmentsList[i].file_in_base64.characters.count>40){
                        let base64:String=attachmentsList[i].file_in_base64;
                        let decodedData = NSData(base64EncodedString: base64, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
                        let decodedimage = UIImage(data: decodedData!);
                        cell.imageDisplay.image = decodedimage! as UIImage
                        break;
                    }
                    else{
                        break;
                    }
                }
            }
        }
        
        
        if(patientList1[indexPath.row].last_name != "NULL"){
            lastname_text=patientList1[indexPath.row].last_name
        }
        if(patientList1[indexPath.row].first_name != "NULL"){
            firstname_text=patientList1[indexPath.row].first_name;
        }
        if(patientList1[indexPath.row].middle_name != "NULL"){
            middlename_text=patientList1[indexPath.row].middle_name;
        }
        if(firstname_text == "" && lastname_text == "" && middlename_text == ""){
            cell.NameLabel.text = "UNKNOWN Patient";
        }
        else{
            cell.NameLabel.text="\(firstname_text) \(middlename_text) \(lastname_text)"
        }
        
        if(patientList1[indexPath.row].birth_month > Int(month)){
            month_age = patientList1[indexPath.row].birth_month-Int(month);
        }
        else {
            month_age = 12-Int(month)+patientList1[indexPath.row].birth_month;
            year_age--;
        }
        
        if(patientList1[indexPath.row].gender_id != "NULL" || patientList1[indexPath.row].gender_id != "undisclosed"){
            for(var i=0; i<gendersList[0].count ; i++){
                if(patientList1[indexPath.row].gender_id==gendersList[0][i].gender_id){
                    gender_text=gendersList[0][i].description;
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
        
        if(patientList1[indexPath.row].natvie_name != "NULL"){
            cell.CountryLabel.text="\(patientList1[indexPath.row].natvie_name)"
        }
        else{
            cell.CountryLabel.text=""
        }
        
        cell.DetailLabel.text="\(gender_text) / \(age_text)"
        return cell;
    }
    
    //Onclick Cell Action
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //State change
        AddVisitState=2;
        
        //Copy target data to variable
        currentVisit=Visit();
        print("Original tag= \(patientList1[indexPath.row].tag)")
        currentVisit.clonePatient(patientList1[indexPath.row]);
        currentVisit.visit_id=patientList1[indexPath.row].visit_id;
        currentVisit.tag=patientList1[indexPath.row].tag;
        
        let headers = [
            "token": token,
        ]
        
        var triagesURL: String = "http://ehr-api.herokuapp.com/v2/triages?visit_id=\(currentVisit.visit_id)";
        
        Alamofire.request(.GET, triagesURL, parameters: nil, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
            if let triagesJSON = Response.result.value{
                if(triagesJSON.count>0){
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
                }
                AddVisitState = 2;
                //Navigate to next controller
                let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TriageModifyViewController") as! TriageModifyViewController;
                self.navigationController?.pushViewController(nextViewController, animated: true);
            }
        }
    }
}