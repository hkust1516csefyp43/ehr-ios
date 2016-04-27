//let date = NSDate();
//let calendar = NSCalendar.currentCalendar();
//let components = calendar.components([.Day , .Month , .Year], fromDate: date);
//let year =  components.year;
//let month =  components.month;
//var year_age:Int = Int(year)-patientList1[indexPath.row].birth_year;
//var month_age:Int;
//var age_text:String="";
//var gender_text:String = "Other";
//var firstname_text:String=""
//var middlename_text:String=""
//var lastname_text:String=""
//let cell=self.TriageFTTableView.dequeueReusableCellWithIdentifier("CellL_Triage", forIndexPath: indexPath) as! CellL_Triage;
//
//if(patientList1[indexPath.row].last_name != "NULL"){
//    lastname_text=patientList1[indexPath.row].last_name
//}
//if(patientList1[indexPath.row].first_name != "NULL"){
//    firstname_text=patientList1[indexPath.row].first_name;
//}
//if(patientList1[indexPath.row].middle_name != "NULL"){
//    middlename_text=patientList1[indexPath.row].middle_name;
//}
//if(firstname_text == "" && lastname_text == "" && middlename_text == ""){
//    cell.NameLabel.text = "UNKNOWN Patient";
//}
//else{
//    cell.NameLabel.text="\(firstname_text) \(middlename_text) \(lastname_text)"
//}
//
//if(patientList1[indexPath.row].birth_month > Int(month)){
//    month_age = patientList1[indexPath.row].birth_month-Int(month);
//}
//else {
//    month_age = 12-Int(month)+patientList1[indexPath.row].birth_month;
//    year_age--;
//}
//
//if(patientList1[indexPath.row].gender_id != "NULL" || patientList1[indexPath.row].gender_id != "undisclosed"){
//    for(var i=0; i<gendersList.count ; i++){
//        if(patientList1[indexPath.row].gender_id==gendersList[i].gender_id){
//            gender_text=gendersList[i].description;
//            break;
//        }
//    }
//}
//
//if(year_age<=130 && year_age>0){
//    age_text="\(year_age) years \(month_age) months old";
//}
//else if(year_age == 0 && month_age>=0){
//    age_text="\(month_age) months old"
//}
//else{
//    age_text="Undisclosed age"
//}
//
//if(patientList1[indexPath.row].natvie_name != "NULL"){
//    cell.CountryLabel.text="\(patientList1[indexPath.row].natvie_name)"
//}
//else{
//    cell.CountryLabel.text=""
//}
//
//cell.DetailLabel.text="\(gender_text) / \(age_text)"
//return cell;
