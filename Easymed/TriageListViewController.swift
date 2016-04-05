//
//  ViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit
import PagingMenuController

class TriageListViewController: UIViewController, PagingMenuControllerDelegate {
    @IBOutlet weak var NavigationItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle Layout
        NavigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add+",
            style: .Plain,
            target: self,
            action: "AddOnClick:"
        );
        // Do any additional setup after loading the view, typically from a nib.
        
        let itsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TriageITSViewController") as! TriageITSViewController;
        let ftViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TriageFTViewController") as! TriageFTViewController;
        
        let triagelistviewControllers = [ftViewController,itsViewController];
        //        let triagelistviewControllers = [ftViewController];
        let options = PagingMenuOptions()
        options.menuHeight = 30
        
        let patientMenuController = self.childViewControllers.first as! PagingMenuController
        patientMenuController.delegate = self
        patientMenuController.setup(viewControllers: triagelistviewControllers, options: options)
    }
    
    func willMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
        
    }
    
    func didMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
        
    }
    func AddOnClick(sender: UIBarButtonItem){
        if(1==1){
            self.performSegueWithIdentifier("Triage_AddVisit", sender: self);
        }
        else{};
    }
}

