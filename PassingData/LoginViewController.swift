//
//  ViewController.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var NameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let mainMenuViewController: MainMenuViewController = segue.destinationViewController as!MainMenuViewController;
        mainMenuViewController.LabelText = NameTextField.text!;
    }
    
    @IBAction func LoginButtonOnclick(sender: AnyObject) {
        //TODO: add logic check
        if(1==1){
            self.performSegueWithIdentifier("LoginToMainMenuSegue", sender: self);
        }
    }
    

}

