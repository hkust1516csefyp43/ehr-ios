//
//  TriageMenuViewController.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 9/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation
import UIKit;

class TriageITSViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TriageITSTableView: UITableView!
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
        
        let cell=self.TriageITSTableView.dequeueReusableCellWithIdentifier("CellR_Triage", forIndexPath: indexPath) as! CellR_Triage;
        
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
        FT_ITS_State=2;
        TriageModifyViewControllerState=2;
        
        //Copy target data to variable
        currentPatient.clonePatient(patientList1[indexPath.row]);
        
        //Copy target data to variable
        currentPatient.clonePatient(patientList2[indexPath.row]);
        //Call Next View Controller
        let triagemodifyViewController = storyboard?.instantiateViewControllerWithIdentifier("TriageModifyViewController") as! TriageModifyViewController;
        navigationController?.pushViewController(triagemodifyViewController, animated: true);
    }
    
    
    
}