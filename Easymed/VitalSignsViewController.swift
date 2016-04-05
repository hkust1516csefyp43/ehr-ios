//
//  File.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation;
import UIKit;
import Alamofire;

class VitalSignsViewController : UIViewController {
    
    @IBOutlet weak var BloodPressure1: UITextField!
    @IBOutlet weak var BloodPressure2: UITextField!
    @IBOutlet weak var PulseRate: UITextField!
    @IBOutlet weak var RespiratoryRate: UITextField!
    @IBOutlet weak var Temperature: UITextField!
    @IBOutlet weak var spO2: UITextField!
    @IBOutlet weak var Weight: UITextField!
    @IBOutlet weak var Height: UITextField!
    @IBOutlet weak var BMI: UILabel!
    @IBOutlet weak var LDD: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BloodPressure1.text=currentVisit.triage.systolic;
        BloodPressure2.text=currentVisit.triage.diastolic;
        PulseRate.text=currentVisit.triage.heartRate;
        RespiratoryRate.text=currentVisit.triage.respiratoryRate;
        Temperature.text=currentVisit.triage.temperature;
        spO2.text=currentVisit.triage.spo2;
        Weight.text=currentVisit.triage.weight;
        Height.text=currentVisit.triage.height;
        if(currentVisit.triage.height != "null" && currentVisit.triage.weight != "null"){
            BMI.text=String(Int(currentVisit.triage.weight)!/(Int(currentVisit.triage.height)!*Int(currentVisit.triage.height)!));
        }
        else{
            BMI.text="Weight or Height is not input";
        }
        
    }
    @IBAction func BloodPressure1OnChange(sender: UITextField) {
        currentVisit.triage.systolic = String!(BloodPressure1.text);
    }
    @IBAction func BloodPressure2OnChange(sender: UITextField) {
        currentVisit.triage.diastolic = String!(BloodPressure2.text);
    }
    @IBAction func PulseRateOnChange(sender: UITextField) {
        currentVisit.triage.heartRate = String!(BloodPressure1.text);
    }
    @IBAction func RespiratoryRateOnChange(sender: UITextField) {
        currentVisit.triage.respiratoryRate = String!(RespiratoryRate.text);
    }
    @IBAction func TemperatureOnChange(sender: UITextField) {
        currentVisit.triage.temperature = String!(Temperature.text);
    }
    @IBAction func spO2OnChange(sender: UITextField) {
        currentVisit.triage.spo2 = String!(spO2.text);
    }
    @IBAction func WeightOnChange(sender: UITextField) {
        currentVisit.triage.weight = String!(Weight.text);
    }
    @IBAction func HeightOnChange(sender: UITextField) {
        currentVisit.triage.height = String!(Height.text);
    }
    
}