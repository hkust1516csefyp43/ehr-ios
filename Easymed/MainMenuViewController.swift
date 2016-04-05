//
//  File.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation;
import UIKit;


class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var NavigationItem: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func TriageOnclick(sender: UIButton) {
        if(1==1){
            next_stage = "2";
            signal = 1;
            self.performSegueWithIdentifier("Triage_Pending", sender: self);
        }
    }
}