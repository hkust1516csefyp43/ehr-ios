//
//  File.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation;
import UIKit;

class PatientDetailViewController : UIViewController {
    var event = -1;
    var Scroll = 0;
    @IBOutlet weak var HorizontalScrollView: UIScrollView!
    @IBOutlet weak var VerticalScrollView: UIScrollView!
    @IBOutlet weak var ScrollButton1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HorizontalScrollView.backgroundColor = UIColor.redColor();
        HorizontalScrollView.contentSize.width = 2300;
                VerticalScrollView.contentSize.width = 2300;
        ScrollButton1.enabled=false;
        currentPatient.getInformation();
        
    }
    
    @IBAction func ScrollButton1OnPress(sender: AnyObject) {
        print("button onpress");
        event = 1;
    }
    @IBAction func ScrollButton1OnRelease(sender: AnyObject) {
        if(Scroll == 0){
        print("button release");
        }
        event = -1;
        Scroll = 0;
    }
    @IBAction func backButtonOnclick(sender: AnyObject) {
        signal = 1;
        self.performSegueWithIdentifier("PatientDetailToPendingSegue", sender: self);
    }
}