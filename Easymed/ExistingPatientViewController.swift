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

class ExistingPatientViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var ExistingPatientTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    
    //Assign number of patient in TriageFT Table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientList2.count;
    }
    
    //Assign content in cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellL=self.ExistingPatientTableView.dequeueReusableCellWithIdentifier("CellL_Triage", forIndexPath: indexPath) as! CellL_Triage;
        cellL.NameLabel.text=patientList2[indexPath.row].first_name;
        var DetailInput : String = "\(patientList2[indexPath.row].gender_id) / ? weeks ago / \(patientList2[indexPath.row].birth_date)-\(patientList2[indexPath.row].birth_month)-\(patientList2[indexPath.row].birth_year)";
        cellL.DetailLabel.text=DetailInput;
        return cellL;
    }
    
    //Onclick Cell Action
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        AddVisitState=1
        
        //Copy target data to variable
        currentVisit=Visit();
        currentVisit.clonePatient(patientList2[indexPath.row]);
        
        //Call Next View Controller
        let nextViewController = storyboard?.instantiateViewControllerWithIdentifier("TriageModifyViewController") as! TriageModifyViewController;
        navigationController?.pushViewController(nextViewController, animated: true);
    }
    
    
}