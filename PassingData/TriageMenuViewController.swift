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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientList.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=self.TriageTableView.dequeueReusableCellWithIdentifier("QueueCell", forIndexPath: indexPath) as! Cell_Triage;
//        cell.NameLabel.text=nameList[indexPath.row];
        cell.NameLabel.text=patientList[indexPath.row].firstName;
        var DetailInput : String = "\(patientList[indexPath.row].gender) / \(patientList[indexPath.row].lastSeen) weeks ago / \(patientList[indexPath.row].dateOfBirth)";
        cell.DetailLabel.text=DetailInput;
        
        return cell;
    }
    //onclick action to view which one is pressing
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        //CODE TO BE RUN ON CELL TOUCH
//        NameArray.removeAtIndex(indexPath.row);
//        Age.removeAtIndex(indexPath.row);
//        self.TableView.reloadData();
//        
//    }


    //    @IBAction func ButtonOnclick (sender: UIButton!) {
    //
    //        performSegueWithIdentifier("nextView", sender: self)
    //
    //    }
    
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //        let loginViewController: LoginViewController = segue.destinationViewController as!LoginViewController;
    //    }
    //    
    @IBAction func TriageBackMainMenu(sender: AnyObject) {
        if(1==1){
            self.performSegueWithIdentifier("TriageToMainSegue", sender: self);
        }
        
    }
}