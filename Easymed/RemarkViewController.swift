//
//  File.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation;
import UIKit;

class RemarkViewController : UIViewController {
    
    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet weak var verticalScrollView: UIScrollView!
    @IBOutlet weak var remark: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        verticalScrollView.contentSize.height=1080;
        if(AddVisitState==2){
            remark.text=currentVisit.triage.remark;
        }
        if(currentVisit.triage.remark == "NULL"){
            Switch.on=false;
        }
    }
    @IBAction func SwitchChange(sender: UISwitch) {
        if(Switch.on){
            remark.editable=true;
            remark.text="";
        }
        if(!Switch.on){
            remark.text="NULL";
            currentVisit.triage.remark="NULL";
            remark.editable=false;
        }
    }
    func textViewDidChange(textView: UITextView) {
        currentVisit.triage.remark=String!(remark.text);
        edit_triage=1;
    }
}