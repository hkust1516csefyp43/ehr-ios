//
//  User.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 8/3/16.
//  Copyright © 2016 John. All rights reserved.
//

class patient{
    var patientID: String = " "; //start from 0;
    var honorific: String = " ";
    var firstName: String = " ";
    var middleName: String = " ";
    var lastName: String = " ";
    var phoneCountryId: Int = -1;
    var phoneNumber: Int = -1;
    var address: String = " ";
    var dateOfBirth = -1; //TODO
    var gender: String = " ";
    var photo: String = " ";
    var slumID: String = " ";
    var bloodType: String = " ";
    var createTimpStamp = -1; //TODO
    var lastSeen: Int = -1; //TODO
    var nextStation: Int = -1; //0=Triage, 1=Consultation, 2=Pharmacy
    var email: String = " ";
    
//    init(){
//    }
    
//    init(JSON : AnyObject){
//        self.patientID = JSON["patient_id"] as! String;
//    }
    
    func test_setup(firstname: String, gender: String, lastSeen: Int, dateOfBirth: Int){
        self.firstName = firstname;
        self.gender = gender;
        self.lastSeen = lastSeen;
        self.dateOfBirth = dateOfBirth;
        return;
    }
}