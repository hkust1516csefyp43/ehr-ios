//
//  ViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit
import PagingMenuController

class ConsultationListViewController: UIViewController, PagingMenuControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let beforeConsultationViewController = self.storyboard?.instantiateViewControllerWithIdentifier("BeforeConsultationViewController") as! BeforeConsultationViewController;
        let afterConsultationViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AfterConsultationViewController") as! AfterConsultationViewController;
        
//        let afterConsultationViewController = self.storyboard?.instantiateViewControllerWithIdentifier("BeforeConsultationViewController") as! BeforeConsultationViewController;
//        let beforeConsultationViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TriagebeforeConsultationViewController") as! TriagebeforeConsultationViewController;

        let triagelistviewControllers = [beforeConsultationViewController,afterConsultationViewController];
        //        let triagelistviewControllers = [beforeConsultationViewController];
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

}

