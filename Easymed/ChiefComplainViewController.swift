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

class ChiefComplainViewController : UIViewController {
    
    @IBOutlet weak var topic: UILabel!
    @IBOutlet weak var ChiefComplain: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topic.lineBreakMode = NSLineBreakMode.ByWordWrapping;
    }
    
}