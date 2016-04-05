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
    }
    @IBAction func BloodPressure1OnChange(sender: UITextField) {
    }
    @IBAction func BloodPressure2OnChange(sender: UITextField) {
    }
    @IBAction func PulseRateOnChange(sender: UITextField) {
    }
    @IBAction func RespiratoryRateOnChange(sender: UITextField) {
    }
    @IBAction func TemperatureOnChange(sender: UITextField) {
    }
    @IBAction func spO2OnChange(sender: UITextField) {
    }
    @IBAction func WeightOnChange(sender: UITextField) {
    }
    @IBAction func HeightOnChange(sender: UITextField) {
    }
    
}