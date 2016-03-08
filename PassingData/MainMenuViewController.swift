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
    @IBOutlet weak var NameShowingLabel: UILabel!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var AdminButton: UIButton!
    
    var LabelText: String = "Label";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NameShowingLabel.text=LabelText;
    }
    
    @IBAction func BackLoginButtonOnclick(sender: AnyObject) {
        //TODO: add logic check
        if(1==1){
            self.performSegueWithIdentifier("MainMenuViewToLoginViewSegue", sender: self);
        }
        
    }
    
    @IBAction func AdminButtonOnclick(sender: AnyObject) {
        //TODO: add logic chec
        if(1==1){
            self.performSegueWithIdentifier("MainMenuToAdminSegue", sender: self);
        }
    }

    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let loginViewController: LoginViewController = segue.destinationViewController as!LoginViewController;
//    }
//    
}