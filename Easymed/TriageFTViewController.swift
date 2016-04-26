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
//        let cellL=self.TriageFTTableView.dequeueReusableCellWithIdentifier("CellL_Triage", forIndexPath: indexPath) as! CellL_Triage;
//        cellL.NameLabel.text=patientList1[indexPath.row].first_name;
//        var DetailInput : String = "\(patientList1[indexPath.row].gender_id) / ? weeks ago / \(patientList1[indexPath.row].birth_date)-\(patientList1[indexPath.row].birth_month)-\(patientList1[indexPath.row].birth_year)";
//        cellL.DetailLabel.text=DetailInput;
//        cellL.DetailLabel.text = String(patientList1[indexPath.row].birth_month);
//        if(patientList1[indexPath.row].natvie_name != "NULL"){
//        cellL.CountryLabel.text=patientList1[indexPath.row].natvie_name;
//        }
//        return cellL;
        
        let date = NSDate();
        let calendar = NSCalendar.currentCalendar();
        let components = calendar.components([.Day , .Month , .Year], fromDate: date);
        let year =  components.year;
        let month =  components.year;
        var year_age:Int = Int(year)-patientList1[indexPath.row].birth_year;
        var month_age:Int;
        if(patientList1[indexPath.row].birth_month>Int(month)){
            month_age = Int(month)-patientList1[indexPath.row].birth_month;
        }
        else {
            month_age = 12-Int(month)+patientList1[indexPath.row].birth_month;
            year_age--;
        }
        
        let cell=self.TriageFTTableView.dequeueReusableCellWithIdentifier("CellL_Triage", forIndexPath: indexPath) as! CellL_Triage;
        
        if(patientList1[indexPath.row].middle_name == "NULL"){
            if(patientList1[indexPath.row].first_name == "NULL"){
            cell.NameLabel.text="\(patientList1[indexPath.row].last_name)"
            }
            else{
            cell.NameLabel.text="\(patientList1[indexPath.row].first_name) \(patientList1[indexPath.row].last_name)"
            }
        }
        else{
            if(patientList1[indexPath.row].first_name == "NULL"){
            cell.NameLabel.text="\(patientList1[indexPath.row].middle_name) \(patientList1[indexPath.row].last_name)"
            }
            else{
            cell.NameLabel.text="\(patientList1[indexPath.row].first_name) \(patientList1[indexPath.row].middle_name) \(patientList1[indexPath.row].last_name)"
            }
        }
        
        if(year_age<=130 && year_age>0){
            cell.DetailLabel.text="\(year_age) years \(month_age) months old";
        }
        else if(year_age == 0 && month_age>=0){
            cell.DetailLabel.text="\(month_age) months old"
        }
        else{
            cell.DetailLabel.text="Undisclosed age"
        }
        
        if(patientList1[indexPath.row].natvie_name != "NULL"){
            cell.CountryLabel.text="\(patientList1[indexPath.row].natvie_name)"
        }
        else{
            cell.CountryLabel.text=""
        }
        return cell;

    }
    
    //Onclick Cell Action
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //State change
        AddVisitState=1;
        
        //Copy target data to variable
        currentVisit=Visit();
        currentVisit.clonePatient(patientList1[indexPath.row]);
        
        let headers = [
            "token": token,
        ]
        
        var visitsURL: String = "http://ehr-api.herokuapp.com/v2/visits?patient_id=\(currentVisit.patient.patient_id)";
        
        Alamofire.request(.GET, visitsURL, parameters: nil, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
            if let visitJSON = Response.result.value{
                if(visitJSON.count != 1){
                    print("error:patient has more than 1 visits");
                }
                else{
                    currentVisit.visit_id=visitJSON[0]["visit_id"]as! String;
                    currentVisit.tag=visitJSON[0]["tag"]as! Int;
                    var triagesURL: String = "http://ehr-api.herokuapp.com/v2/triages?visit_id=\(currentVisit.visit_id)";
                    
                    Alamofire.request(.GET, triagesURL, parameters: nil, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
                        if let triagesJSON = Response.result.value{
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
                            
                            AddVisitState = 2;
                            
                            //Navigate to next controller
                            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TriageModifyViewController") as! TriageModifyViewController;
                            self.navigationController?.pushViewController(nextViewController, animated: true);
                        }
                    }
                }
            }
        }
    }
}