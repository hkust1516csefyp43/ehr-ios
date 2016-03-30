//
//  User.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 8/3/16.
//  Copyright © 2016 John. All rights reserved.
//

class Patient{
    var patient_id: String = "unknown"; //PK
    var honorific: String! = nil;
    var first_name: String = "unknown"; //PK
    var middle_name: String! = nil;
    var last_name: String! = nil;
    var address: String! = nil;
    var email: String! = nil;
    var birth_year: Int! = nil;
    var birth_month: Int! = nil;
    var birth_date: Int! = nil;
    var createTimeStamp = -1; //TODO: find libarary to change it
    var clinic_id: String = "unknown";//FK
    var gender_id: String = "unknown"; //FK
    var image_id : String! = nil;
    var blood_type_id: String! = nil;
    var phone_number_country_code: String! = nil;
    var phone_number: Int! = nil;
    var natvie_name: String! = nil;
    
    init(){
        
    }
    
    func getInformation () {
        print("\(self.patient_id)\n \(self.honorific)\n \(self.first_name) \n \(self.middle_name)\n \(self.last_name)\n \(self.address)\n \(self.email)\n \(self.birth_year)\n \(self.birth_month)\n \(self.birth_date)\n \(self.createTimeStamp)\n \(self.clinic_id)\n \(self.gender_id)\n \(self.image_id)\n \(self.blood_type_id)\n \(self.phone_number_country_code)\n \(self.phone_number)\n \(self.natvie_name)\n");
    }
    
    func clonePatient(target: Patient){
        self.patient_id = target.patient_id;
        self.honorific = target.honorific;
        self.first_name = target.first_name
        self.middle_name = target.middle_name;
        self.last_name = target.last_name;
        self.address = target.address;
        self.email = target.email;
        self.birth_year = target.birth_year;
        self.birth_month = target.birth_month;
        self.birth_date = target.birth_date;
        self.createTimeStamp = target.createTimeStamp;
        self.clinic_id = target.clinic_id;
        self.gender_id = target.gender_id;
        self.image_id  = target.image_id;
        self.blood_type_id = target.blood_type_id;
        self.phone_number_country_code = target.phone_number_country_code;
        self.phone_number = target.phone_number;
        self.natvie_name = target.natvie_name;
    }
}

