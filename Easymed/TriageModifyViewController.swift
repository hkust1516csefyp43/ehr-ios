//
//  ViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit
import PagingMenuController

class TriageModifyViewController: UIViewController, PagingMenuControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Copy currentPatient data to Temp, so all temp patient modify will save at there
        tempPatient.clonePatient(currentPatient);
        
        //Add sliding page+button
        let personaldataViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PersonalDataViewController") as! PersonalDataViewController;
        let vitalsignsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("VitalSignsViewController") as! VitalSignsViewController;
        let chiefcomplainViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ChiefComplainViewController") as! ChiefComplainViewController;
        let remarkViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RemarkViewController") as! RemarkViewController;
        
        
        //        let hpiViewController = self.storyboard?.instantiateViewControllerWithIdentifier("HPIViewController") as! HPIViewController;
        //        let previousmedicalhistoryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PreviousMedicalHistoryViewController") as! PreviousMedicalHistoryViewController;
        //        let familyhistoryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("FamilyHistoryViewController") as! FamilyHistoryViewController;
        //        let socialhistoryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SocialHistoryViewController") as! SocialHistoryViewController;
        //        let drughistoryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DrugHistoryViewController") as! DrugHistoryViewController;
        //        let screeningViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ScreeningViewController") as! ScreeningViewController;
        //        let allergyViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AllergyViewController") as! AllergyViewController;
        //        let pregnancyViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PregnancyViewController") as! PregnancyViewController;
        //        let reviewofthesystemViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ReviewOfTheSystemViewController") as! ReviewOfTheSystemViewController;
        
        //Finishted Triage Case
        let triagemodifyFTViewController = [personaldataViewController,vitalsignsViewController,chiefcomplainViewController,remarkViewController];
        let options = PagingMenuOptions()
        options.menuHeight = 30
        
        let pagingmenuController = self.childViewControllers.first as! PagingMenuController
        pagingmenuController.delegate = self;
        pagingmenuController.setup(viewControllers: triagemodifyFTViewController, options: options)
        
        //Add navigationbar button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Confirm", style: .Plain, target: self, action:"SaveButtonOnclick:")
    }
    
    
    func SaveButtonOnclick(sender: UIBarButtonItem) {
        currentPatient.Compare(tempPatient);
//        currentPatient.getInformation();
//        tempPatient.getInformation();
    }
    
    func willMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {

    }
    
    func didMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
        
    }
}

