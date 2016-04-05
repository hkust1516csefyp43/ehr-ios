//
//  User.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 8/3/16.
//  Copyright © 2016 John. All rights reserved.
//

class Triage{
    var triage_id: String = "null";
    var user_id: String = "null";
    var systolic: Int = -1;
    var diastolic: Int = -1;
    var heartRate: Int = -1;
    var weight: Int = -1;
    var height: Int = -1;
    var temperature: Int = -1;
    var spo2: Int = -1;
    var headCircumference: String = "null"; //TODO: what is this
    var chiefComplains: String = "null";
    var startedTimeStamp = -1;//TODO: find libarary to change it
    var endTimeStamp  = -1; //TODO: find libarary to change it
    var editedInConsultation :Int = -1;
    
    init(){
        
    }
}

