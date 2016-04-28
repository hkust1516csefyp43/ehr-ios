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
        let month =  components.month;
        var year_age:Int = Int(year)-patientList2[indexPath.row].birth_year;
        var month_age:Int;
        var age_text:String="";
        var gender_text:String = "Other";
        var firstname_text:String=""
        var middlename_text:String=""
        var lastname_text:String=""
        let cell=self.TriageITSTableView.dequeueReusableCellWithIdentifier("CellR_Triage", forIndexPath: indexPath) as! CellR_Triage;
        
        cell.imageDisplay.image = UIImage(named: "defaultPatient");
        if (patientList2[indexPath.row].image_id != "NULL"){
            for(var i=0; i<attachmentsList.count ; i++){
                if(patientList2[indexPath.row].image_id == attachmentsList[i].attachment_id){
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
            for(var i=0; i<gendersList[0].count ; i++){
                if(patientList2[indexPath.row].gender_id==gendersList[0][i].gender_id){
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
        
        if(patientList2[indexPath.row].natvie_name != "NULL"){
            cell.CountryLabel.text="\(patientList2[indexPath.row].natvie_name)"
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
        FT_ITS_State=2;
        TriageModifyViewControllerState=2;
        
        //Copy target data to variable
        currentPatient.clonePatient(patientList2[indexPath.row]);
        
        //Copy target data to variable
        currentPatient.clonePatient(patientList2[indexPath.row]);
        //Call Next View Controller
        let triagemodifyViewController = storyboard?.instantiateViewControllerWithIdentifier("TriageModifyViewController") as! TriageModifyViewController;
        navigationController?.pushViewController(triagemodifyViewController, animated: true);
    }
    
    
    
}