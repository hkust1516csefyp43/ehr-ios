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

class ReviewOfTheSystemViewController : UIViewController {
    
    @IBOutlet weak var EENTSwitch: UISwitch!
    @IBOutlet weak var RespiratorySwitch: UISwitch!
    @IBOutlet weak var CardiovascularSwitch: UISwitch!
    @IBOutlet weak var GastrointestinalSwitch: UISwitch!
    @IBOutlet weak var GenitalSwitch: UISwitch!
    @IBOutlet weak var ENTSwitch: UISwitch!
    @IBOutlet weak var SkinSwitch: UISwitch!
    @IBOutlet weak var LocomotorSwitch: UISwitch!
    @IBOutlet weak var NeurologySwitch: UISwitch!
    
    @IBOutlet weak var EENT: UITextView!
    @IBOutlet weak var Respiratory: UITextView!
    @IBOutlet weak var Cardiovascular: UITextView!
    @IBOutlet weak var Gastrointestinal: UITextView!
    @IBOutlet weak var Genital: UITextView!
    @IBOutlet weak var ENT: UITextView!
    @IBOutlet weak var Skin: UITextView!
    @IBOutlet weak var Locomotor: UITextView!
    @IBOutlet weak var Neurology: UITextView!
    
    @IBOutlet weak var ScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ScrollView.contentSize.height=1580;
    }
    
    func textViewDidChange(textView: UITextView) {
        if(textView == self.EENT){
            //                    if(self.EENT.text != "text here"){
            //                        currentVisit.consultation.ros_ent=EENT.text;
            //                    }
        }
        else if(textView == self.Respiratory){
            currentVisit.consultation.ros_respi = Respiratory.text;
        }
        else if(textView == self.Cardiovascular){
            currentVisit.consultation.ros_cardio = Cardiovascular.text;
        }
        else if(textView == self.Gastrointestinal){
            currentVisit.consultation.ros_gastro = Gastrointestinal.text;
        }
        else if(textView == self.Genital){
            currentVisit.consultation.ros_genital = Genital.text;
        }
        else if(textView == self.ENT){
            currentVisit.consultation.ros_ent = self.ENT.text
        }
        else if(textView == self.Skin){
            currentVisit.consultation.ros_skin = Skin.text;
        }
        else if(textView == self.Locomotor){
            //                    if(self.Locomotor.text != "text here"){
            //                        currentVisit.consultation.ros_ = Locomotor.text;
            //                    }
        }
        else if(textView == self.Neurology){
            //                    if(self.Neurology.text != "text here"){
            //                        currentVisit.consultation.ro = Neurology.text;
            //                    }
        }
    }
}