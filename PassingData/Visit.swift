//
//  Visit.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 14/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation

class Visit{
    var visit_id:String = "unknown";
    var create_timestamp = -1;
    var tag:Int = -1;
    var next_station:Int! = nil;
    var patient_id:String! = "unknown";
 
    init(){
        
    }
    
    func getInformation (){
        print("\(self.visit_id)\n \(self.create_timestamp)\n \(self.tag) \n \(self.next_station)\n \(self.patient_id)\n")
    }
}