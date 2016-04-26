//
//  ViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit
import PagingMenuController

class PharmacyListViewController: UIViewController, PagingMenuControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let beforePharmacyViewController = self.storyboard?.instantiateViewControllerWithIdentifier("BeforePharmacyViewController") as! BeforePharmacyViewController;
        let afterPharmacyViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AfterPharmacyViewController") as! AfterPharmacyViewController;
        
        
        let pharmacylistviewControllers = [beforePharmacyViewController,afterPharmacyViewController];
        
        let options = PagingMenuOptions()
        options.menuHeight = 30
        
        let nextController = self.childViewControllers.first as! PagingMenuController
        nextController.delegate = self
        nextController.setup(viewControllers: pharmacylistviewControllers, options: options)
    }
    
    func willMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
        
    }
    
    func didMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
        
    }
    
    @IBAction func BackOnclick(sender: UIButton) {
        let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuViewController") as! MainMenuViewController;
        self.navigationController?.pushViewController(nextViewController, animated: true);
    }
}

