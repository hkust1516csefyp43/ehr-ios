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

class AddPrescriptionViewController : UIViewController {
    
    @IBOutlet weak var descipsion: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(currentPrescription.use==1 && currentPrescription.prescription_detail != "NULL"){
            descipsion.text = currentPrescription.prescription_detail;
        }
    }
    
    @IBAction func AddOnclick(sender: UIButton) {
        for(var i=0; i<prescriptionsList.count ; i++){
            if(prescriptionsList[i].medication_id==currentPrescription.medication_id){
                prescriptionsList[i].use = 1;
                if(descipsion.text != ""){
                    prescriptionsList[i].prescription_detail=descipsion.text;
                }
                else{
                    prescriptionsList[i].prescription_detail="NULL";
                }
                break;
            }
        }
        currentPrescription = prescriptions();
        self.navigationController?.popViewControllerAnimated(true);
    }
    @IBAction func RemoveOnclick(sender: UIButton) {
        if(currentPrescription.use==1){
            for(var i=0; i<prescriptionsList.count ; i++){
                if(prescriptionsList[i].medication_id==currentPrescription.medication_id){
                    prescriptionsList[i].use = 0;
                    prescriptionsList[i].prescription_detail="NULL";
                    break;
                }
            }
            currentPrescription = prescriptions();
            self.navigationController?.popViewControllerAnimated(true);
        }
    }
}