//
//  File.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation;
import UIKit;

class PregnancyViewController : UIViewController {
    
    
    @IBOutlet weak var LMPdate: UITextField!
    @IBOutlet weak var PregnancyNo: UITextField!
    @IBOutlet weak var VerticalScrollView: UIScrollView!
    @IBOutlet weak var BreastFeeding: UISwitch!
    @IBOutlet weak var ContraceptiveUse: UISwitch!
    @IBOutlet weak var pregnant: UISwitch!
    @IBOutlet weak var pregnant_date: UITextField!
    @IBOutlet weak var LiveBirth: UITextField!
    @IBOutlet weak var Miscarriage: UITextField!
    @IBOutlet weak var Abortion: UITextField!
    @IBOutlet weak var StillBirth: UITextField!
    @IBOutlet weak var OtherInfo: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad();
        VerticalScrollView.contentSize.height=1100;
        //        pregnant
        //        if(AddVisitState==2){
        //            systolic.text=currentVisit.triage.systolic;
        //            diastolic.text=currentVisit.triage.diastolic;
        //            heartRate.text=currentVisit.triage.heartRate;
        //            respiratoryRate.text=currentVisit.triage.respiratoryRate;
        //            temperature.text=currentVisit.triage.temperature;
        //            spo2.text=currentVisit.triage.spo2;
        //            weight.text=currentVisit.triage.weight;
        //            height.text=currentVisit.triage.height;
        //            if(currentVisit.triage.height != "NULL" && currentVisit.triage.weight != "NULL"){
        //                bmi.text=String(floor(Double(currentVisit.triage.weight)!/(Double(currentVisit.triage.height)!*Double(currentVisit.triage.height)!)*100)/100);
        //            }
        //            else{
        //                bmi.text="Weight or Height is not input";
        //            }
        //        }
    }

    @IBAction func LMPdateOnClick(sender: UITextField) {
        currentVisit.consultation.preg_lmp = LMPdate.text!;
    }
    @IBAction func pregnantChange(sender: UISwitch) {
     
    }
    @IBAction func GestionChange(sender: UITextField) {
        currentVisit.consultation.preg_gestration = pregnant_date.text!;
    }
    @IBAction func BreastFeedingChange(sender: UISwitch) {
        if(BreastFeeding.on==true){
            currentVisit.consultation.preg_breast_feeding = true;
        }
        else{
            currentVisit.consultation.preg_breast_feeding = false;
        }
    }
    @IBAction func ContraceptiveUseChange(sender: UISwitch) {
        if(ContraceptiveUse.on==true){
            currentVisit.consultation.preg_contraceptive = true;
        }
        else{
            currentVisit.consultation.preg_contraceptive = false;
        }
    }
    @IBAction func noPregnancyChange(sender: UITextField) {
        currentVisit.consultation.preg_num_preg = PregnancyNo.text!;
    }
    @IBAction func noLiveBirthChange(sender: UITextField) {
        currentVisit.consultation.preg_num_live_birth = LiveBirth.text!;
    }
    @IBAction func noMiscarriageChange(sender: UITextField) {
        currentVisit.consultation.preg_num_miscarriage = Miscarriage.text!;
    }
    @IBAction func noAbortionChange(sender: UITextField) {
        currentVisit.consultation.preg_num_abourtion = Abortion.text!;
    }
    @IBAction func noStillBirthChange(sender: UITextField) {
        currentVisit.consultation.preg_num_still_birth = StillBirth.text!;
    }
    func textViewDidChange(textView: UITextView) {
        currentVisit.consultation.preg_remark = OtherInfo.text;
    }
}