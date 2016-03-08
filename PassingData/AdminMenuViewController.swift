//
//  File.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation;
import UIKit;

var count = 0;
class AdminMenuViewController : UIViewController {

    @IBOutlet weak var TextingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TextingLabel.text = String(count);
    }

    @IBAction func MainMenuButtonOnclick(sender: AnyObject) {
        if(1==1){
            self.performSegueWithIdentifier("AdminToMainMenuSegue", sender: self);
        }
    }
    
    @IBAction func AddValue(sender: AnyObject) {
        count += 1;
        TextingLabel.text = String(count);
    }
//    @IBAction func ButtonOnclick (sender: UIButton!) {
//        
//        performSegueWithIdentifier("nextView", sender: self)
//        
//    }
    
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //        let loginViewController: LoginViewController = segue.destinationViewController as!LoginViewController;
    //    }
    //    
}