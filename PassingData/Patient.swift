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
}

