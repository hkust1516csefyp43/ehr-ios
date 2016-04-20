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

class PhysicalExaminationViewController : UIViewController {
    
    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var GeneralApperance: UITextView!
    @IBOutlet weak var Respiratory: UITextView!
    @IBOutlet weak var Cardiovascular: UITextView!
    @IBOutlet weak var Gastrointestinal: UITextView!
    @IBOutlet weak var Genital: UITextView!
    @IBOutlet weak var ENT: UITextView!
    @IBOutlet weak var Skin: UITextView!
    @IBOutlet weak var Other: UITextView!
    
    @IBOutlet weak var ga_switch: UISwitch!
    @IBOutlet weak var RespiratorySwitch: UISwitch!
    @IBOutlet weak var CardiovascularSwitch: UILabel!
    @IBOutlet weak var GastrointestinalSwitch: UILabel!
    @IBOutlet weak var GenitalSwitch: UILabel!
    @IBOutlet weak var ENTSwitch: UILabel!
    @IBOutlet weak var SkinSwitch: UILabel!
    @IBOutlet weak var OtherSwitch: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScrollView.contentSize.height=1400;
    }
    func textViewDidChange(textView: UITextView) {

        if(textView == self.GeneralApperance){
            currentVisit.consultation.pe_general = GeneralApperance.text;
        }
        else if(textView == self.Respiratory){
            currentVisit.consultation.pe_respiratory = Respiratory.text;
        }
        else if(textView == self.Cardiovascular){
            currentVisit.consultation.pe_cardio = Cardiovascular.text;
        }
        else if(textView == self.Gastrointestinal){
            currentVisit.consultation.pe_gastro = Gastrointestinal.text;
        }
        else if(textView == self.Genital){
            currentVisit.consultation.pe_genital = Genital.text;
        }
        else if(textView == self.ENT){
            currentVisit.consultation.pe_ent = ENT.text;
        }
        else if(textView == self.Skin){
            currentVisit.consultation.pe_skin = Skin.text;
        }
        else if(textView == self.Other){
            currentVisit.consultation.pe_other = Other.text;
        }
    }

}
