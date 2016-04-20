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

class FamilyHistoryViewController : UIViewController {
    
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var familyHistory: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ScrollView.contentSize.height=1000;
    }
    func textViewDidChange(textView: UITextView) {
        //        currentVisit.triage.chiefComplains=String!(chiefComplain.text);
        //        edit_triage=1;
    }

    
}