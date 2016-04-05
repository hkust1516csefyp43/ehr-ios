//
//  User.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 8/3/16.
//  Copyright © 2016 John. All rights reserved.
//

class Patient{
    var patient_id: String = "null";
    var honorific: String = "null";
    var first_name: String = "null";
    var middle_name: String = "null";
    var last_name: String! = "null";
    var address: String! = "null";
    var email: String! = "null";
    var birth_year: Int = -1;
    var birth_month: Int = -1;
    var birth_date: Int = -1;
    var createTimeStamp = -1; //TODO: find libarary to change it
    var clinic_id: String = "null";
    var gender_id: String = "null";
    var image_id : String = "null";
    var blood_type_id: String! = "null";
    var phone_number_country_code: String = "null";
    var phone_number: String = "null";
    var natvie_name: String! = "null";
    
    init(){
        
    }
    
//    func fixNil(){
//        if (self.honorific==nil||self.honorific==""){
//            self.honorific="nil";
//        }
//        if (self.first_name==""){
//            self.first_name="nil";
//        }
//        if (self.middle_name==nil||self.middle_name==""){
//            self.middle_name="nil";
//        }
//        if (self.last_name==nil||self.last_name==""){
//            self.last_name="nil";
//        }
//        if (self.address==nil||self.address==""){
//            self.address="nil";
//        }
//        if (self.email==nil||self.email==""){
//            self.email="nil";
//        }
//        if (self.birth_year==nil){
//            self.last_name="nil";
//        }
//        if (self.address==nil||self.address==""){
//            self.address="nil";
//        }
//        if (self.email==nil||self.email==""){
//            self.email="nil";
//        }
//    }
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
    
    func Compare(target: Patient){
        if(self.patient_id != target.patient_id||self.honorific != target.honorific||self.first_name != target.first_name||self.middle_name != target.middle_name||self.last_name != target.last_name||self.address != target.address||self.email != target.email||self.birth_year != target.birth_year||self.birth_month != target.birth_month||self.birth_date != target.birth_date||self.createTimeStamp != target.createTimeStamp||self.clinic_id != target.clinic_id||self.gender_id != target.gender_id||self.image_id  != target.image_id||self.blood_type_id != target.blood_type_id||self.phone_number_country_code != target.phone_number_country_code||self.phone_number != target.phone_number||self.natvie_name != target.natvie_name){
            print("not equal");
        }
        else{print("equal");}
    }
}

