//
//  RepositoriesViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit

class PersonalDataViewController: UIViewController {
    @IBOutlet weak var VerticalScrollView: UIScrollView!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var Gender: UILabel!
    @IBOutlet weak var Birthday: UITextField!
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var PhoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VerticalScrollView.contentSize.height = 800;
        LastName.text = currentPatient.last_name;
        FirstName.text = currentPatient.first_name;
        switch(currentPatient.gender_id){
        case "0":
            Gender.text = "Male";
        case "1":
            Gender.text = "Female";
        case "3":
            Gender.text = "Custom";
        default:
            Gender.text = "Undisclosed";
        }
        Birthday.text="\(currentPatient.birth_date)/\(currentPatient.birth_month)/\(currentPatient.birth_year)";
        if(currentPatient.address==nil){
            Address.text="nil"
        }
        else{
        Address.text=currentPatient.address;
        }
        PhoneNumber.text="\(currentPatient.phone_number)";
        
    }
    
}