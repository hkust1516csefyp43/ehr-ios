//
//  File.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20121979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation;
import UIKit;
import Alamofire;

class MedicationViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var MedicationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewWillAppear(animated: Bool) {
        self.MedicationTableView.reloadData();
    }
    
    //Assign number of patient in Table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prescriptionsList.count;
    }
    
    
    //Assign content in cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=self.MedicationTableView.dequeueReusableCellWithIdentifier("Cell_Medication", forIndexPath: indexPath) as! Cell_Medication;
        if(prescriptionsList[indexPath.row].use == 1){
            cell.Switch.text = "Y";
        }
        else{
            cell.Switch.text = "N";
        }
        for(var i=0; i<medicationsList.count;i++){
            if(prescriptionsList[indexPath.row].medication_id == medicationsList[i].medication_id){
                cell.Title.text = medicationsList[i].medication;
                break;
            }
        }
        cell.Desc.text = prescriptionsList[indexPath.row].prescription_detail;
        return cell;
    }
    
    //Onclick Cell Action
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //UI management
        currentPrescription.prescription_id = prescriptionsList[indexPath.row].prescription_id;
        currentPrescription.medication_id = prescriptionsList[indexPath.row].medication_id;
        currentPrescription.prescription_detail = prescriptionsList[indexPath.row].prescription_detail;
        currentPrescription.use = prescriptionsList[indexPath.row].use;
        
        //Data management
        let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AddPrescriptionViewController") as! AddPrescriptionViewController;
        self.navigationController?.pushViewController(nextViewController, animated: true);
    }
    
}