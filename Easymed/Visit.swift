//
//  User.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 8/3/16.
//  Copyright © 2016 John. All rights reserved.
//

class Visit{
    var visit_id: String = "NULL";
    var createTimeStamp = -1; //TODO: find libarary to change it
    var tag: Int = -1;
    var next_station: Int = 2;
    var patient : Patient = Patient();
    var triage : Triage = Triage();
    
    init(){
        
    }
    
    func getInformation () {
        print("\(self.patient.patient_id)\n");
    }
    func clonePatient(target: Patient){
        self.patient.patient_id = target.patient_id;
        self.patient.honorific = target.honorific;
        self.patient.first_name = target.first_name
        self.patient.middle_name = target.middle_name;
        self.patient.last_name = target.last_name;
        self.patient.address = target.address;
        self.patient.email = target.email;
        self.patient.birth_year = target.birth_year;
        self.patient.birth_month = target.birth_month;
        self.patient.birth_date = target.birth_date;
        self.patient.createTimeStamp = target.createTimeStamp;
        self.patient.clinic_id = target.clinic_id;
        self.patient.gender_id = target.gender_id;
        self.patient.image_id  = target.image_id;
        self.patient.blood_type_id = target.blood_type_id;
        self.patient.phone_number_country_code = target.phone_number_country_code;
        self.patient.phone_number = target.phone_number;
        self.patient.natvie_name = target.natvie_name;
    }
    
}

