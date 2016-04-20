
class Consultation{
    var consultation_id: String = "NULL";
    var user_id: String = "NULL";
    var start_timestamp = 0;//TODO: find libarary to change it
    var end_timestamp  = 0; //TODO: find libarary to change it
    
    
    var ros_ga: String = "NULL";
    var ros_respi: String = "NULL";
    var ros_cardio: String = "NULL";
    var ros_gastro: String = "NULL";
    var ros_genital: String = "NULL";
    var ros_ent: String = "NULL";
    var ros_skin: String = "NULL";
    var ros_other: String = "NULL";
    
    
    var preg_lmp: String  = "NULL";  //todo
    var preg_curr_preg: String = "0";
    var preg_gestration: String = "0";
    var preg_breast_feeding: Bool = false;
    var preg_contraceptive: Bool = false;
    var preg_num_preg: String = "0";
    var preg_num_live_birth: String = "0";
    var preg_num_miscarriage: String = "0";
    var preg_num_abourtion: String = "0";
    var preg_num_still_birth: String = "0";
    var preg_remark: String = "NULL";
    
    
    var pe_general: String = "NULL";
    var pe_respiratory: String = "NULL";
    var pe_cardio: String = "NULL";
    var pe_gastro: String = "NULL";
    var pe_genital: String = "NULL";
    var pe_ent: String = "NULL";
    var pe_skin: String = "NULL";
    var pe_other: String = "NULL";
    var rt_aiertness: String = "NULL";
    var rt_breathing: String = "NULL";
    var rt_circulation: String = "NULL";
    var rt_dehydration: String = "NULL";
    var rt_defg: String = "NULL";
    var diagnosis: String = "NULL";
    var advice: String = "NULL";
    var follow_up: String = "NULL";
    var education: String = "NULL";
    var remark: String = "NULL";
    init(){
        
    }
}

