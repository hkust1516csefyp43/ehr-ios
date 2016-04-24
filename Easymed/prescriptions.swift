class prescriptions{
    
    var prescription_id:String = "NULL";
    var consultation_id:String = "NULL";
    var medication_id:String = "NULL";
    var prescription_detail:String = "NULL";
    var prescribed:Int = 0;
    var use:Int = 0;
    var pharmacy_decision:Int = 0;
    
    init(){
        
    }
    
    func compare(obj2:prescriptions)->Int{
        if(self.use != obj2.use){
            if(obj2.use==1){
                return 1;
            }
            if(obj2.use==0){
                return 3;
            }
        }
        if(self.prescription_detail != obj2.prescription_detail){
            return 2;
        }
        return 0;
    }
    
    func compare_prescription_decision(obj2:prescriptions)->Int{
        if(self.pharmacy_decision != obj2.pharmacy_decision){
            return 1;
        }
        return 0;
    }

}