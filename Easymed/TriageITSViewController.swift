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
        let cellR=self.TriageITSTableView.dequeueReusableCellWithIdentifier("CellR_Triage", forIndexPath: indexPath) as! CellR_Triage;
        //        cell.NameLabel.text=nameList[indexPath.row];
        cellR.NameLabel.text=patientList2[indexPath.row].first_name;
        var DetailInput : String = "\(patientList2[indexPath.row].gender_id) / ? weeks ago / \(patientList2[indexPath.row].birth_date)-\(patientList2[indexPath.row].birth_month)-\(patientList2[indexPath.row].birth_year)";
        cellR.DetailLabel.text=DetailInput;
        return cellR;
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