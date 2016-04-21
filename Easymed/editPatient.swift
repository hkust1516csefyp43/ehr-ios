//    func SaveButtonOnclick(sender: UIBarButtonItem) {
//        //Handle input=""
//        var trimString = currentVisit.patient.first_name.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            // TASK WARNING FOR FIRST NAME NULL
//            print("First name cannot be NULL")
//        }
//        trimString = currentVisit.patient.last_name.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.patient.last_name="NULL";
//        }
//        trimString = currentVisit.patient.address.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.patient.address="NULL";
//        }
//        trimString = currentVisit.patient.phone_number.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.patient.phone_number="NULL";
//        }
//        trimString = currentVisit.triage.systolic.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.triage.systolic="0";
//        }
//        trimString = currentVisit.triage.diastolic.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.triage.diastolic="0";
//        }
//        trimString = currentVisit.triage.heartRate.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.triage.heartRate="0";
//        }
//        trimString = currentVisit.triage.respiratoryRate.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.triage.respiratoryRate="0";
//        }
//        trimString = currentVisit.triage.spo2.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.triage.spo2="0";
//        }
//        trimString = currentVisit.triage.temperature.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.triage.temperature="0";
//        }
//        trimString = currentVisit.triage.weight.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.triage.weight="0";
//        }
//        trimString = currentVisit.triage.height.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.triage.height="0";
//        }
//        trimString = currentVisit.triage.chiefComplains.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.triage.chiefComplains="NULL";
//        }
//        trimString = currentVisit.triage.remark.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.triage.remark="NULL";
//        }
//        
//        // trim review of the system input
//        trimString = currentVisit.consultation.ros_respi.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.ros_respi="NULL";
//        }
//        trimString = currentVisit.consultation.ros_cardio.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.ros_cardio="NULL";
//        }
//        trimString = currentVisit.consultation.ros_gastro.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.ros_gastro="NULL";
//        }
//        trimString = currentVisit.consultation.ros_genital.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.ros_genital="NULL";
//        }
//        trimString = currentVisit.consultation.ros_ent.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.ros_ent="NULL";
//        }
//        trimString = currentVisit.consultation.ros_skin.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.ros_skin="NULL";
//        }
//        
//        //trim Physical Examination input
//        trimString=currentVisit.consultation.pe_general.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.pe_general="NULL";
//        }
//        
//        trimString=currentVisit.consultation.pe_respiratory.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.pe_respiratory="NULL";
//        }
//        
//        trimString=currentVisit.consultation.pe_cardio.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.pe_cardio="NULL";
//        }
//        
//        trimString=currentVisit.consultation.pe_gastro.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.pe_gastro="NULL";
//        }
//        
//        trimString=currentVisit.consultation.pe_genital.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.pe_genital="NULL";
//        }
//        
//        trimString=currentVisit.consultation.pe_ent.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.pe_ent="NULL";
//        }
//        
//        trimString=currentVisit.consultation.pe_skin.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.pe_skin="NULL";
//        }
//        
//        trimString=currentVisit.consultation.pe_other.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.pe_other="NULL";
//        }
//        
//        //trim pregnancy input
//        trimString=currentVisit.consultation.preg_gestration.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.preg_gestration="NULL";
//        }
//        
//        trimString=currentVisit.consultation.preg_num_preg.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.preg_num_preg="0";
//        }
//        
//        trimString=currentVisit.consultation.preg_num_live_birth.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.preg_num_live_birth="0";
//        }
//        
//        trimString=currentVisit.consultation.preg_num_miscarriage.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.preg_num_miscarriage="0";
//        }
//        
//        trimString=currentVisit.consultation.preg_num_abourtion.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.preg_num_abourtion="0";
//        }
//        
//        trimString=currentVisit.consultation.preg_num_still_birth.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.preg_num_still_birth="0";
//        }
//        
//        trimString=currentVisit.consultation.preg_remark.stringByTrimmingCharactersInSet(
//            NSCharacterSet.whitespaceAndNewlineCharacterSet());
//        if(trimString==""){
//            currentVisit.consultation.preg_remark="NULL";
//        }
//        
//        //Start create data in database
//        if(ConsultationState==0){
//            edit_visit=1;
//            edit_consultation=1;
//            ConsultationState = -1;
//            AddVisitState = -1;
//            
//            if(edit_patient == 1){
//                // PUT patients
//                let patientsjson : [String: AnyObject] = [
//                    "honorific":currentVisit.patient.honorific,
//                    "first_name": currentVisit.patient.first_name,
//                    "middle_name":currentVisit.patient.middle_name,
//                    "last_name": currentVisit.patient.last_name,
//                    "address":currentVisit.patient.address,
//                    "email":currentVisit.patient.email,
//                    //ref
//                    "gender_id": "caw23232",
//                    "birth_year":currentVisit.patient.birth_year,
//                    "birth_month":currentVisit.patient.birth_month,
//                    "birth_date":currentVisit.patient.birth_date,
//                    //ref value
//                    //                "blood_type_id":currentVisit.patient.blood_type_id,
//                    //ref value
//                    "phone_number_country_code":currentVisit.patient.phone_number_country_code,
//                    "phone_number":currentVisit.patient.phone_number,
//                    "native_name":currentVisit.patient.natvie_name
//                ];
//                
//                let patientsheaders = [
//                    "token": token,
//                    "Content-Type": "application/json"
//                ];
//                let patientsURL: String = "http://ehr-api.herokuapp.com/v2/patients/\(currentVisit.patient.patient_id)";
//                print("PUT: \(patientsURL)");
//                Alamofire.request(.PUT, patientsURL, parameters: patientsjson, encoding: .JSON, headers: patientsheaders).responseJSON { (Response) -> Void in
//                    if let patientsJSON = Response.result.value{
//                        print("Success: PUT patient tuple");
//                        edit_patient=0;
//                        if(edit_triage==0 && edit_consultation==0 && edit_visit==0){
//                            //Navigate to next controller
//                            simulate_click = 1;
//                            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuViewController") as! MainMenuViewController;
//                            self.navigationController?.pushViewController(nextViewController, animated: true);
//                        }
//                    }
//                    else{
//                        print("Fail: PUT patient tuple");
//                    }
//                }
//            }
//            
//            if(edit_visit == 1){
//                // PUT patients
//                let visitsjson : [String: AnyObject] = [
//                    "next_station" : 2,
//                    //here hello
//                ];
//                
//                let visitsheaders = [
//                    "token": token,
//                    "Content-Type": "application/json"
//                ];
//                let patientsURL: String = "http://ehr-api.herokuapp.com/v2/visits/\(currentVisit.visit_id)";
//                print("POST: \(patientsURL)");
//                Alamofire.request(.PUT, patientsURL, parameters: visitsjson, encoding: .JSON, headers: visitsheaders).responseJSON { (Response) -> Void in
//                    if let visitsJSON = Response.result.value{
//                        print("Success: PUT visit tuple");
//                        edit_visit=0;
//                        if(edit_triage==0 && edit_consultation==0 && edit_patient==0){
//                            //Navigate to next controller
//                            simulate_click = 1;
//                            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuViewController") as! MainMenuViewController;
//                            self.navigationController?.pushViewController(nextViewController, animated: true);
//                        }
//                    }
//                    else{
//                        print("Fail: PUT visits tuple");
//                    }
//                }
//            }
//            
//            if(edit_triage == 1){
//                // PUT triages
//                let triagesjson : [String: AnyObject] = [
//                    "user_id": userID,
//                    "systolic": Int(currentVisit.triage.systolic)!,
//                    "diastolic": Int(currentVisit.triage.diastolic)!,
//                    "heart_rate": Int(currentVisit.triage.heartRate)!,
//                    "respiratory_rate": Int(currentVisit.triage.respiratoryRate)!,
//                    "weight":Int(currentVisit.triage.weight)!,
//                    "height":Int(currentVisit.triage.height)!,
//                    "temperature":Int(currentVisit.triage.temperature)!,
//                    "spo2":Int(currentVisit.triage.spo2)!,
//                    //                               "last_deworming_tablet":currentVisit.triage.lastDewormingTablet,
//                    "chief_complains":currentVisit.triage.chiefComplains,
//                    "remark":currentVisit.triage.remark,
//                    //                   "start_timestamp":startTimeStamp,
//                    //                   "end_timestamp":visitsJSON["create_timestamp"] as! String,
//                    //"edited_in_consultation":"FALSE",
//                    "head_circumference":Int(currentVisit.triage.headCircumference)!
//                ];
//                let triagesheaders = [
//                    "token": token,
//                    "Content-Type": "application/json"
//                ];
//                let triagesURL: String = "http://ehr-api.herokuapp.com/v2/triages/\(currentVisit.triage.triage_id)";
//                print("POST: \(triagesURL)");
//                Alamofire.request(.PUT, triagesURL, parameters: triagesjson, encoding: .JSON, headers: triagesheaders).responseJSON { (Response) -> Void in
//                    if let triagesJSON = Response.result.value{
//                        print("Success: PUT triage tuple");
//                        edit_triage=0;
//                        if(edit_patient==0 && edit_consultation==0 && edit_visit==0){
//                            //Navigate to next controller
//                            simulate_click = 1;
//                            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuViewController") as! MainMenuViewController;
//                            self.navigationController?.pushViewController(nextViewController, animated: true);
//                        }
//                    }
//                    else{
//                        print("Fail: PUT triage tuple");
//                    }
//                }
//            }
//            let consultationsjson : [String: AnyObject] = [
//                "visit_id": currentVisit.visit_id,
//                "user_id": userID,
//                "start_timestamp": "2016-03-11 02:45:27",
//                "end_timestamp": "2016-03-11 02:45:27",
//                
//                //Review of the system
//                "ros_respi": currentVisit.consultation.ros_respi,
//                "ros_cardio": currentVisit.consultation.ros_cardio,
//                "ros_gastro": currentVisit.consultation.ros_gastro,
//                "ros_genital": currentVisit.consultation.ros_genital,
//                "ros_ent": currentVisit.consultation.ros_ent,
//                "ros_skin": currentVisit.consultation.ros_skin,
//                
//                //Physical Examination
//                "pe_general" : currentVisit.consultation.pe_general,
//                "pe_respiratory" : currentVisit.consultation.pe_respiratory,
//                "pe_cardio" : currentVisit.consultation.pe_cardio,
//                "pe_gastro" : currentVisit.consultation.pe_gastro,
//                "pe_genital" : currentVisit.consultation.pe_genital,
//                "pe_ent" : currentVisit.consultation.pe_ent,
//                "pe_skin" : currentVisit.consultation.pe_skin,
//                "pe_other" : currentVisit.consultation.pe_other,
//                
//                //pregnancy
//                // "preg_lmp" : "preg_lmp",
//                "preg_curr_preg" : Int(currentVisit.consultation.preg_curr_preg)!,
//                "preg_gestration" : Int(currentVisit.consultation.preg_gestration)!,
//                "preg_breast_feeding" : Bool(currentVisit.consultation.preg_breast_feeding),
//                "preg_contraceptive" : Bool(currentVisit.consultation.preg_contraceptive),
//                "preg_num_preg" : Int(currentVisit.consultation.preg_num_preg)!,
//                "preg_num_live_birth" : Int(currentVisit.consultation.preg_num_live_birth)!,
//                "preg_num_miscarriage" : Int(currentVisit.consultation.preg_num_miscarriage)!,
//                "preg_num_abortion" : Int(currentVisit.consultation.preg_num_abourtion)!,
//                "preg_num_still_birth" :Int(currentVisit.consultation.preg_num_still_birth)!,
//                "preg_remark" :  currentVisit.consultation.preg_remark,
//            ];
//            let consultationsheaders = [
//                "token": token,
//                "Content-Type": "application/json"
//            ];
//            let consultationsURL: String = "http://ehr-api.herokuapp.com/v2/consultations";
//            print("POST: \(consultationsURL)");
//            Alamofire.request(.POST, consultationsURL, parameters: consultationsjson, encoding: .JSON, headers: consultationsheaders).responseJSON { (Response) -> Void in
//                if let consultationsJSON = Response.result.value{
//                    //POST related_data
//                    var count=0;
//                    for (var i=0 ; i<related_dataList.count ; i++){
//                        let related_datajson : [String: AnyObject] = [
//                            "data": related_dataList[i].data,
//                            "remark": related_dataList[i].remark,
//                            "consultation_id": consultationsJSON["consultation_id"] as! String,
//                            "category": related_dataList[i].category,
//                        ];
//                        let related_dataheaders = [
//                            "token": token,
//                            "Content-Type": "application/json"
//                        ];
//                        let related_dataURL: String = "http://ehr-api.herokuapp.com/v2/related_data";
//                        print("POST: \(related_dataURL)");
//                        Alamofire.request(.POST, related_dataURL, parameters: related_datajson, encoding: .JSON, headers: related_dataheaders).responseJSON { (Response) -> Void in
//                            if let related_dataJSON = Response.result.value{
//                                count++;
//                                if(count>=related_dataList.count){
//                                    edit_consultation=0;
//                                    if(edit_patient==0 && edit_triage==0 && edit_visit==0){
//                                        //Navigate to next controller
//                                        simulate_click = 1;
//                                        let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuViewController") as! MainMenuViewController;
//                                        self.navigationController?.pushViewController(nextViewController, animated: true);
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//                else{
//                    print("Fail: POST consultation tuple");
//                }
//            }
//        }
//        else if(ConsultationState == 1){
//            //            edit_consultation=1;
//            ConsultationState = -1;
//            AddVisitState = -1;
//            
//            if(edit_patient == 1){
//                // PUT patients
//                let patientsjson : [String: AnyObject] = [
//                    "honorific":currentVisit.patient.honorific,
//                    "first_name": currentVisit.patient.first_name,
//                    "middle_name":currentVisit.patient.middle_name,
//                    "last_name": currentVisit.patient.last_name,
//                    "address":currentVisit.patient.address,
//                    "email":currentVisit.patient.email,
//                    //ref
//                    "gender_id": "caw23232",
//                    "birth_year":currentVisit.patient.birth_year,
//                    "birth_month":currentVisit.patient.birth_month,
//                    "birth_date":currentVisit.patient.birth_date,
//                    //ref value
//                    //                "blood_type_id":currentVisit.patient.blood_type_id,
//                    //ref value
//                    "phone_number_country_code":currentVisit.patient.phone_number_country_code,
//                    "phone_number":currentVisit.patient.phone_number,
//                    "native_name":currentVisit.patient.natvie_name
//                ];
//                
//                let patientsheaders = [
//                    "token": token,
//                    "Content-Type": "application/json"
//                ];
//                let patientsURL: String = "http://ehr-api.herokuapp.com/v2/patients/\(currentVisit.patient.patient_id)";
//                print("PUT: \(patientsURL)");
//                Alamofire.request(.PUT, patientsURL, parameters: patientsjson, encoding: .JSON, headers: patientsheaders).responseJSON { (Response) -> Void in
//                    if let patientsJSON = Response.result.value{
//                        print("Success: PUT patient tuple");
//                        edit_patient=0;
//                        if(edit_triage==0 && edit_consultation==0 && edit_visit==0){
//                            //Navigate to next controller
//                            simulate_click = 1;
//                            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuViewController") as! MainMenuViewController;
//                            self.navigationController?.pushViewController(nextViewController, animated: true);
//                        }
//                    }
//                    else{
//                        print("Fail: PUT patient tuple");
//                    }
//                }
//            }
//            if(edit_triage == 1){
//                // PUT triages
//                let triagesjson : [String: AnyObject] = [
//                    "user_id": userID,
//                    "systolic": Int(currentVisit.triage.systolic)!,
//                    "diastolic": Int(currentVisit.triage.diastolic)!,
//                    "heart_rate": Int(currentVisit.triage.heartRate)!,
//                    "respiratory_rate": Int(currentVisit.triage.respiratoryRate)!,
//                    "weight":Int(currentVisit.triage.weight)!,
//                    "height":Int(currentVisit.triage.height)!,
//                    "temperature":Int(currentVisit.triage.temperature)!,
//                    "spo2":Int(currentVisit.triage.spo2)!,
//                    //                               "last_deworming_tablet":currentVisit.triage.lastDewormingTablet,
//                    "chief_complains":currentVisit.triage.chiefComplains,
//                    "remark":currentVisit.triage.remark,
//                    //                   "start_timestamp":startTimeStamp,
//                    //                   "end_timestamp":visitsJSON["create_timestamp"] as! String,
//                    //"edited_in_consultation":"FALSE",
//                    "head_circumference":Int(currentVisit.triage.headCircumference)!
//                ];
//                let triagesheaders = [
//                    "token": token,
//                    "Content-Type": "application/json"
//                ];
//                let triagesURL: String = "http://ehr-api.herokuapp.com/v2/triages/\(currentVisit.triage.triage_id)";
//                print("PUT: \(triagesURL)");
//                Alamofire.request(.PUT, triagesURL, parameters: triagesjson, encoding: .JSON, headers: triagesheaders).responseJSON { (Response) -> Void in
//                    if let triagesJSON = Response.result.value{
//                        print("Success: PUT triage tuple");
//                        edit_triage=0;
//                        if(edit_patient==0 && edit_consultation==0 && edit_visit==0){
//                            //Navigate to next controller
//                            simulate_click = 1;
//                            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuViewController") as! MainMenuViewController;
//                            self.navigationController?.pushViewController(nextViewController, animated: true);
//                        }
//                    }
//                    else{
//                        print("Fail: PUT triage tuple");
//                    }
//                }
//            }
//            
//            //            task
//            //            else if
//            let consultationsjson : [String: AnyObject] = [
//                "visit_id": currentVisit.visit_id,
//                "user_id": userID,
//                "start_timestamp": "2016-03-11 02:45:27",
//                "end_timestamp": "2016-03-11 02:45:27",
//                
//                //Review of the system
//                "ros_respi": currentVisit.consultation.ros_respi,
//                "ros_cardio": currentVisit.consultation.ros_cardio,
//                "ros_gastro": currentVisit.consultation.ros_gastro,
//                "ros_genital": currentVisit.consultation.ros_genital,
//                "ros_ent": currentVisit.consultation.ros_ent,
//                "ros_skin": currentVisit.consultation.ros_skin,
//                
//                //Physical Examination
//                "pe_general" : currentVisit.consultation.pe_general,
//                "pe_respiratory" : currentVisit.consultation.pe_respiratory,
//                "pe_cardio" : currentVisit.consultation.pe_cardio,
//                "pe_gastro" : currentVisit.consultation.pe_gastro,
//                "pe_genital" : currentVisit.consultation.pe_genital,
//                "pe_ent" : currentVisit.consultation.pe_ent,
//                "pe_skin" : currentVisit.consultation.pe_skin,
//                "pe_other" : currentVisit.consultation.pe_other,
//                
//                //pregnancy
//                // "preg_lmp" : "preg_lmp",
//                "preg_curr_preg" : Int(currentVisit.consultation.preg_curr_preg)!,
//                "preg_gestration" : Int(currentVisit.consultation.preg_gestration)!,
//                "preg_breast_feeding" : Bool(currentVisit.consultation.preg_breast_feeding),
//                "preg_contraceptive" : Bool(currentVisit.consultation.preg_contraceptive),
//                "preg_num_preg" : Int(currentVisit.consultation.preg_num_preg)!,
//                "preg_num_live_birth" : Int(currentVisit.consultation.preg_num_live_birth)!,
//                "preg_num_miscarriage" : Int(currentVisit.consultation.preg_num_miscarriage)!,
//                "preg_num_abortion" : Int(currentVisit.consultation.preg_num_abourtion)!,
//                "preg_num_still_birth" :Int(currentVisit.consultation.preg_num_still_birth)!,
//                "preg_remark" :  currentVisit.consultation.preg_remark,
//            ];
//            let consultationsheaders = [
//                "token": token,
//                "Content-Type": "application/json"
//            ];
//            let consultationsURL: String = "http://ehr-api.herokuapp.com/v2/consultations";
//            print("POST: \(consultationsURL)");
//            Alamofire.request(.POST, consultationsURL, parameters: consultationsjson, encoding: .JSON, headers: consultationsheaders).responseJSON { (Response) -> Void in
//                if let consultationsJSON = Response.result.value{
//                    //POST related_data
//                    var count=0;
//                    for (var i=0 ; i<related_dataList.count ; i++){
//                        let related_datajson : [String: AnyObject] = [
//                            "data": related_dataList[i].data,
//                            "remark": related_dataList[i].remark,
//                            "consultation_id": consultationsJSON["consultation_id"] as! String,
//                            "category": related_dataList[i].category,
//                        ];
//                        let related_dataheaders = [
//                            "token": token,
//                            "Content-Type": "application/json"
//                        ];
//                        let related_dataURL: String = "http://ehr-api.herokuapp.com/v2/related_data";
//                        print("POST: \(related_dataURL)");
//                        Alamofire.request(.POST, related_dataURL, parameters: related_datajson, encoding: .JSON, headers: related_dataheaders).responseJSON { (Response) -> Void in
//                            if let related_dataJSON = Response.result.value{
//                                count++;
//                                if(count>=related_dataList.count){
//                                    edit_consultation=0;
//                                    if(edit_patient==0 && edit_triage==0 && edit_visit==0){
//                                        //Navigate to next controller
//                                        simulate_click = 1;
//                                        let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuViewController") as! MainMenuViewController;
//                                        self.navigationController?.pushViewController(nextViewController, animated: true);
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//                else{
//                    print("Fail: POST consultation tuple");
//                }
//            }
//        }
//    }