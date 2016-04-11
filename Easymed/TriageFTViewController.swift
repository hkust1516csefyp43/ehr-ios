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
        let cellL=self.TriageFTTableView.dequeueReusableCellWithIdentifier("CellL_Triage", forIndexPath: indexPath) as! CellL_Triage;
        cellL.NameLabel.text=patientList1[indexPath.row].first_name;
        var DetailInput : String = "\(patientList1[indexPath.row].gender_id) / ? weeks ago / \(patientList1[indexPath.row].birth_date)-\(patientList1[indexPath.row].birth_month)-\(patientList1[indexPath.row].birth_year)";
        cellL.DetailLabel.text=DetailInput;
        return cellL;
    }
    
    //Onclick Cell Action
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //State change
        AddVisitState=1;
        
        //Copy target data to variable
        currentVisit=Visit();
        currentVisit.clonePatient(patientList1[indexPath.row]);
        
        //Call Next View Controller
        let triagemodifyViewController = storyboard?.instantiateViewControllerWithIdentifier("TriageModifyViewController") as! TriageModifyViewController;
        navigationController?.pushViewController(triagemodifyViewController, animated: true);
    }
    
    
}