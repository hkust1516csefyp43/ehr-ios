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

class ExistingPatientViewController : UIViewController, UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var ExistingPatientTableView: UITableView!
    @IBOutlet weak var NameSearch: AutoCompleteTextField!
    private var responseData:NSMutableData?
    private var dataTask:NSURLSessionDataTask?
    var SearchTextList:[String] = [String]();
    var SearchPatientList:[Patient] = [Patient]();
    var searchMode=0;
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        NameSearch.delegate=self;
        self.view.bringSubviewToFront(NameSearch);
        //keyboard
        //        self.hideKeyboardWhenTappedAround()
        for(var i = 0; i<patientList2.count;i++){
            var firstname_text:String=""
            var middlename_text:String=""
            var lastname_text:String=""
            var nativename_text:String=""
            if(patientList2[i].last_name != "NULL"){
                lastname_text=patientList2[i].last_name
            }
            if(patientList2[i].first_name != "NULL"){
                firstname_text=patientList2[i].first_name;
            }
            if(patientList2[i].middle_name != "NULL"){
                middlename_text=patientList2[i].middle_name;
            }
            if(patientList2[i].natvie_name != "NULL"){
                nativename_text=("(\(patientList2[i].natvie_name))");
            }
            var name_text:String = "\(firstname_text) \(middlename_text) \(lastname_text) \(nativename_text)"
            SearchTextList.append(name_text);
            configureTextField();
            handleTextFieldInterfaces();
        }
    }
    
    
    //Assign number of patient in TriageFT Table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchMode==1){
            return SearchPatientList.count;
        }
        else{
            return patientList2.count;
        }
    }
    
    //Assign content in cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var autoCompleteData:[String] = [String]();
        let date = NSDate();
        let calendar = NSCalendar.currentCalendar();
        let components = calendar.components([.Day , .Month , .Year], fromDate: date);
        let year =  components.year;
        let month =  components.month;
        var year_age:Int;
        var month_age:Int;
        var age_text:String="";
        var gender_text:String = "Other";
        var firstname_text:String=""
        var middlename_text:String=""
        var lastname_text:String=""
        let cell=self.ExistingPatientTableView.dequeueReusableCellWithIdentifier("Cell_existingPatient", forIndexPath: indexPath) as! Cell_existingPatient;
        if(searchMode==1){
            year_age=Int(year)-SearchPatientList[indexPath.row].birth_year;
            if(SearchPatientList[indexPath.row].last_name != "NULL"){
                lastname_text=SearchPatientList[indexPath.row].last_name
            }
            if(SearchPatientList[indexPath.row].first_name != "NULL"){
                firstname_text=SearchPatientList[indexPath.row].first_name;
            }
            if(SearchPatientList[indexPath.row].middle_name != "NULL"){
                middlename_text=SearchPatientList[indexPath.row].middle_name;
            }
            if(firstname_text == "" && lastname_text == "" && middlename_text == ""){
                cell.NameLabel.text = "UNKNOWN Patient";
            }
            else{
                cell.NameLabel.text="\(firstname_text) \(middlename_text) \(lastname_text)"
            }
            
            if(SearchPatientList[indexPath.row].birth_month > Int(month)){
                month_age = SearchPatientList[indexPath.row].birth_month-Int(month);
            }
            else {
                month_age = 12-Int(month)+SearchPatientList[indexPath.row].birth_month;
                year_age--;
            }
            
            if(SearchPatientList[indexPath.row].gender_id != "NULL" || SearchPatientList[indexPath.row].gender_id != "undisclosed"){
                for(var i=0; i<gendersList[0].count ; i++){
                    if(SearchPatientList[indexPath.row].gender_id==gendersList[0][i].gender_id){
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
            
            if(SearchPatientList[indexPath.row].natvie_name != "NULL"){
                cell.NativeNameLabel.text="\(SearchPatientList[indexPath.row].natvie_name)"
            }
            else{
                cell.NativeNameLabel.text=""
            }
            
            cell.AgeLabel.text="\(gender_text) / \(age_text)"
        }
        else{
            year_age=Int(year)-patientList2[indexPath.row].birth_year;
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
                cell.NativeNameLabel.text="\(patientList2[indexPath.row].natvie_name)"
            }
            else{
                cell.NativeNameLabel.text=""
            }
            
            cell.AgeLabel.text="\(gender_text) / \(age_text)"
        }
        return cell;
        
    }
    
    //Onclick Cell Action
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        AddVisitState=1
        
        //Copy target data to variable
        currentVisit=Visit();
        if(searchMode==1){
            currentVisit.clonePatient(SearchPatientList[indexPath.row]);
        }
        else{
            currentVisit.clonePatient(patientList2[indexPath.row]);
        }
        //Call Next View Controller
        let nextViewController = storyboard?.instantiateViewControllerWithIdentifier("TriageModifyViewController") as! TriageModifyViewController;
        navigationController?.pushViewController(nextViewController, animated: true);
    }
    
    @IBAction func BackOnclick(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    private func configureTextField(){
        NameSearch.autoCompleteTextColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        NameSearch.autoCompleteTextFont = UIFont(name: "HelveticaNeue-Light", size: 12.0)!
        NameSearch.autoCompleteCellHeight = 35.0
        NameSearch.maximumAutoCompleteCount = 20
        NameSearch.hidesWhenSelected = true
        NameSearch.hidesWhenEmpty = true
        NameSearch.enableAttributedText = true
        var attributes = [String:AnyObject]()
        attributes[NSForegroundColorAttributeName] = UIColor.redColor()
        attributes[NSFontAttributeName] = UIFont(name: "HelveticaNeue-Bold", size: 12.0)
        NameSearch.autoCompleteAttributes = attributes
    }
    
    
    private func handleTextFieldInterfaces(){
        NameSearch.onTextChange = {[weak self] text in
            if !text.isEmpty{
                if let dataTask = self?.dataTask {
                    dataTask.cancel()
                }
                self?.fetchAutocompleteSports(text)
            }
        }
    }
    
    private func fetchAutocompleteSports(keyword:String) {
        var temp:[String] = [String]();
        if(keyword==""){
            searchMode=0;
        }
        else{
            SearchPatientList.removeAll();
            for(var i=0; i<SearchTextList.count ; i++){
                if SearchTextList[i].lowercaseString.rangeOfString("\(keyword.lowercaseString)") != nil {
                    temp.append(SearchTextList[i]);
                    SearchPatientList.append(patientList2[i]);
                }
            }
            searchMode=1;
        }
        self.NameSearch.autoCompleteStrings = temp;
        dataTask?.resume()
        self.ExistingPatientTableView.reloadData();
    }
    
    
    
}