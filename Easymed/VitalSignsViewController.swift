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
        if(AddVisitState==2){
                    systolic.text=currentVisit.triage.systolic;
                    diastolic.text=currentVisit.triage.diastolic;
                    heartRate.text=currentVisit.triage.heartRate;
                    respiratoryRate.text=currentVisit.triage.respiratoryRate;
                    temperature.text=currentVisit.triage.temperature;
                    spo2.text=currentVisit.triage.spo2;
                    weight.text=currentVisit.triage.weight;
                    height.text=currentVisit.triage.height;
                    if(currentVisit.triage.height != "NULL" && currentVisit.triage.weight != "NULL"){
                        bmi.text=String(floor(Double(currentVisit.triage.weight)!/(Double(currentVisit.triage.height)!*Double(currentVisit.triage.height)!)*100)/100);
                    }
                    else{
                        bmi.text="Weight or Height is not input";
                    }
        }
    }
    @IBAction func systolicOnChange(sender: UITextField) {
        currentVisit.triage.systolic=String!(systolic.text);
        edit_triage=1;
    }
    
    @IBAction func diastolicOnChange(sender: UITextField) {
        currentVisit.triage.diastolic=String!(diastolic.text);
        edit_triage=1;
    }
    @IBAction func heartRateOnChange(sender: UITextField) {
        currentVisit.triage.heartRate=String!(heartRate.text);
        edit_triage=1;
    }
    @IBAction func respiratoryRateOnChange(sender: UITextField) {
        currentVisit.triage.respiratoryRate=String!(respiratoryRate.text);
        edit_triage=1;
    }
    @IBAction func temperatureOnChange(sender: UITextField) {
        currentVisit.triage.temperature=String!(temperature.text);
        edit_triage=1;
    }
    @IBAction func spo2OnChange(sender: UITextField) {
        currentVisit.triage.spo2=String!(spo2.text);
        edit_triage=1;
    }
    @IBAction func weightOnChange(sender: UITextField) {
        currentVisit.triage.weight=String!(weight.text);
        edit_triage=1;
    }
    @IBAction func heightOnChange(sender: UITextField) {
        currentVisit.triage.height=String!(height.text);
        edit_triage=1;
    }
    
}