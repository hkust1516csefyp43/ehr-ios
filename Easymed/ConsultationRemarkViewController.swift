//
//  File.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation;
import UIKit;

class ConsultationRemarkViewController : UIViewController {
    
    @IBOutlet weak var verticalScrollView: UIScrollView!

    @IBOutlet weak var remark: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verticalScrollView.contentSize.height=1080;
        if(ConsultationState == 1){
            remark.text=currentVisit.consultation.remark;
        }
    }
    func textViewDidChange(textView: UITextView) {
        currentVisit.consultation.remark=remark.text;
        edit_consultation=1;
    }
}