//
//  File.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation;
import UIKit;

class VitalSignsViewController : UIViewController {
    
    @IBOutlet weak var systolic: UITextField!
    @IBOutlet weak var diastolic: UITextField!
    @IBOutlet weak var heartRate: UITextField!
    @IBOutlet weak var respiratoryRate: UITextField!
    @IBOutlet weak var temperature: UITextField!
    @IBOutlet weak var spo2: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var ldd: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(AddVisitState==1||AddVisitState==2){
            //        systolic.text=currentVisit.triage.systolic;
            //        diasystolic.text=currentVisit.triage.diastolic;
            //        heartRate.text=currentVisit.triage.heartRate;
            //        respiratoryRate.text=currentVisit.triage.respiratoryRate;
            //        temperature.text=currentVisit.triage.temperature;
            //        spo2.text=currentVisit.triage.spo2;
            //        weight.text=currentVisit.triage.weight;
            //        height.text=currentVisit.triage.height;
            //        if(currentVisit.triage.height != "NULL" && currentVisit.triage.weight != "NULL"){
            //            bmi.text=String(Int(currentVisit.triage.weight)!/(Int(currentVisit.triage.height)!*Int(currentVisit.triage.height)!));
            //        }
            //        else{
            //            bmi.text="Weight or Height is not input";
            //        }
        }
    }
    @IBAction func systolicOnChange(sender: UITextField) {
        let trim = systolic.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        if(String!(trim)==""){
            systolic.text="NULL";
        }
        currentVisit.triage.systolic=String!(systolic.text);
        edit_triage=1;
    }
    
    @IBAction func diastolicOnChange(sender: UITextField) {
        let trim = diastolic.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        if(String!(trim)==""){
            diastolic.text="NULL";
        }
        currentVisit.triage.diastolic=String!(diastolic.text);
        edit_triage=1;
    }
    @IBAction func heartRateOnChange(sender: UITextField) {
        let trim = heartRate.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        if(String!(trim)==""){
            heartRate.text="NULL";
        }
        currentVisit.triage.heartRate=String!(heartRate.text);
        edit_triage=1;
    }
    @IBAction func respiratoryRateOnChange(sender: UITextField) {
        let trim = respiratoryRate.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        if(String!(trim)==""){
            respiratoryRate.text="NULL";
        }
        currentVisit.triage.respiratoryRate=String!(respiratoryRate.text);
        edit_triage=1;
    }
    @IBAction func temperatureOnChange(sender: UITextField) {
        let trim = temperature.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        if(String!(trim)==""){
            temperature.text="NULL";
        }
        currentVisit.triage.temperature=String!(temperature.text);
        edit_triage=1;
    }
    @IBAction func spo2OnChange(sender: UITextField) {
        let trim = spo2.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        if(String!(trim)==""){
            spo2.text="NULL";
        }
        currentVisit.triage.spo2=String!(spo2.text);
        edit_triage=1;
    }
    @IBAction func weightOnChange(sender: UITextField) {
        let trim = weight.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        if(String!(trim)==""){
            weight.text="NULL";
        }
        currentVisit.triage.weight=String!(weight.text);
        edit_triage=1;
    }
    @IBAction func heightOnChange(sender: UITextField) {
        let trim = height.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        if(String!(trim)==""){
            height.text="NULL";
        }
        currentVisit.triage.spo2=String!(spo2.text);
        edit_triage=1;
    }
    
}