//
//  TriageMenuViewController.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 9/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation
import UIKit;

class TriageMenuViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    //    @IBOutlet weak var TriageTableView: UITableView!
    @IBOutlet weak var TriageTableView: UITableView!
    
    @IBOutlet weak var FinishedButton: UIButton!
    
    @IBOutlet weak var InThisSlumButton: UIButton!
    
    @IBOutlet weak var AddButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.UIsetup();
        signal = -1;
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientList.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=self.TriageTableView.dequeueReusableCellWithIdentifier("QueueCell", forIndexPath: indexPath) as! Cell_Triage;
        //        cell.NameLabel.text=nameList[indexPath.row];
        cell.NameLabel.text=patientList[indexPath.row].first_name;
        var DetailInput : String = "\(patientList[indexPath.row].gender_id) / ? weeks ago / \(patientList[indexPath.row].birth_date)-\(patientList[indexPath.row].birth_month)-\(patientList[indexPath.row].birth_year)";
        cell.DetailLabel.text=DetailInput;
        
        return cell;
    }
    //Onclick Cell Action
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            //CODE TO BE RUN ON CELL TOUCH
            currentPatient.clonePatient(patientList[indexPath.row]);
            self.performSegueWithIdentifier("TriageToPatientDetailSegue", sender: self);
        }
    
    
    //    @IBAction func ButtonOnclick (sender: UIButton!) {
    //
    //        performSegueWithIdentifier("nextView", sender: self)
    //
    //    }
    
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //        let loginViewController: LoginViewController = segue.destinationViewController as!LoginViewController;
    //    }
    //
    func UIsetup(){
        if(signal==1){
            FinishedButton.backgroundColor = UIColor.whiteColor();
            InThisSlumButton.backgroundColor = UIColor.blueColor();
            InThisSlumButton.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 15.0)
            InThisSlumButton.enabled = false;
        }
        else if(signal==2){
            FinishedButton.backgroundColor = UIColor.blueColor();
            InThisSlumButton.backgroundColor = UIColor.whiteColor();
            FinishedButton.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 15.0)
            FinishedButton.enabled = false;
        }
    }
    
    @IBAction func FinishedButtonOnpress(sender: AnyObject) {
        //        InThisSlumButton.titleLabel?.textColor=UIColor.blueColor();
        //        FinishedButton.titleLabel?.textColor=UIColor.whiteColor();
        signal=2;
        self.performSegueWithIdentifier("TriageToPendingSegue", sender: self);
    }
    @IBAction func InThisSlumOnpress(sender: AnyObject) {
        //        InThisSlumButton.titleLabel?.textColor=UIColor.whiteColor();
        //        FinishedButton.titleLabel?.textColor=UIColor.blueColor();
        signal=1;
        self.performSegueWithIdentifier("TriageToPendingSegue", sender: self);
    }
    
    @IBAction func TriageBackMainMenu(sender: AnyObject) {
        if(1==1){
            self.performSegueWithIdentifier("TriageToMainSegue", sender: self);
        }
        
    }
}