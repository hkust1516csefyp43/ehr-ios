//
//  File.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation;
import UIKit;

class ChiefComplainViewController : UIViewController {
    @IBOutlet weak var verticalScrollView: UIScrollView!
    @IBOutlet weak var chiefComplain: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        verticalScrollView.contentSize.height=1080;
        if(AddVisitState==2){
            chiefComplain.text=currentVisit.triage.chiefComplains;
        }
    }
    func textViewDidChange(textView: UITextView) {
        //        let trimString = chiefComplain.text!.stringByTrimmingCharactersInSet(
        //            NSCharacterSet.whitespaceAndNewlineCharacterSet());
        //        if(trimString==""){
        //            LastName.text="NULL"
        //        }
        currentVisit.triage.chiefComplains=String!(chiefComplain.text);
        edit_triage=1;
    }
}