//
//  ViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit
import PagingMenuController

class TriagePatientViewController: UIViewController, PagingMenuControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let personaldataViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PersonalDataViewController") as! PersonalDataViewController
        let vitalsignsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("VitalSignsViewController") as! VitalSignsViewController
        let chiefcomplainController = self.storyboard?.instantiateViewControllerWithIdentifier("ChiefComplainViewController") as! ChiefComplainViewController
        let remarkViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RemarkViewController") as! RemarkViewController
        
        let triagepatientControllers = [personaldataViewController, vitalsignsViewController, chiefcomplainController, remarkViewController]
        
        let options = PagingMenuOptions()
        options.menuHeight = 50
        
        let patientMenuController = self.childViewControllers.first as! PagingMenuController
        patientMenuController.delegate = self
        patientMenuController.setup(viewControllers: triagepatientControllers, options: options)
    }

    // MARK: - PagingMenuControllerDelegate
    
    func willMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {

    }
    
    func didMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {

    }
}

