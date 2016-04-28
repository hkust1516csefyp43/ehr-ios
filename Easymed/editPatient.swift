////
////  File.swift
////  PassingData
////
////  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
////  Copyright © 2016 John. All rights reserved.
////
//
//import Foundation;
//import UIKit;
//import Alamofire;
//
//class AddNewViewController: UIViewController {
//    
//    @IBOutlet weak var objTitle: AutoCompleteTextField!
//    @IBOutlet weak var Descripsion: UITextView!
//    @IBOutlet weak var delete: UIButton!
//    private var responseData:NSMutableData?
//    private var dataTask:NSURLSessionDataTask?
//    var autotextdata:[String]=[String]();
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //keyboard
//        self.hideKeyboardWhenTappedAround()
//        
//        autotextdata.removeAll();
//        for(var i=0;i<keywordsList.count;i++){
//            var obj:String=keywordsList[i].keyword
//            autotextdata.append(obj);
//        }
//        autotextdata.sortInPlace();
//        
//        configureTextField();
//        handleTextFieldInterfaces();
//        if(related_dataState == 1){
//            delete.enabled=true;
//            objTitle.text = currentRelatedData.data;
//            if(currentRelatedData.remark != "NULL"){
//                Descripsion.text = currentRelatedData.remark;
//            }
//        }
//    }
//    
//    //UI AUTOTEXTING SETUP
//    private func configureTextField(){
//        objTitle.autoCompleteTextColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
//        objTitle.autoCompleteTextFont = UIFont(name: "HelveticaNeue-Light", size: 12.0)!
//        objTitle.autoCompleteCellHeight = 35.0
//        objTitle.maximumAutoCompleteCount = 20
//        objTitle.hidesWhenSelected = true
//        objTitle.hidesWhenEmpty = true
//        objTitle.enableAttributedText = true
//        var attributes = [String:AnyObject]()
//        attributes[NSForegroundColorAttributeName] = UIColor.redColor()
//        attributes[NSFontAttributeName] = UIFont(name: "HelveticaNeue-Bold", size: 12.0)
//        objTitle.autoCompleteAttributes = attributes
//    }
//    
//    private func handleTextFieldInterfaces(){
//        objTitle.onTextChange = {[weak self] text in
//            if !text.isEmpty{
//                if let dataTask = self?.dataTask {
//                    dataTask.cancel()
//                }
//                self?.fetchAutocompleteRelatedData(text)
//            }
//        }
//    }
//    
//    private func fetchAutocompleteRelatedData(keyword:String) {
//        var temp:[String] = ["John", "Johnny", "Joseph", "Jane","Joe"]
//        //        var temp:[String] = [String]();
//        //        for(var i=0; i<autotextdata.count ; i++){
//        //            if autotextdata[i].lowercaseString.rangeOfString("\(keyword)") != nil {
//        //                temp.append(autotextdata[i]);
//        //            }
//        //        }
//        self.objTitle.autoCompleteStrings = temp;
//        dataTask?.resume()
//    }
//    
//    @IBAction func DeleteOnclick(sender: UIButton) {
//        if(ConsultationState == 1){
//            var obj:related_data = related_data();
//            obj.rd_id = related_dataList[Int(currentRelatedData.rd_id)!].rd_id;
//            deleted_related_dataList.append(obj);
//            deleted_related_data = 1;
//        }
//        related_dataList.removeAtIndex(Int(currentRelatedData.rd_id)!);
//        self.navigationController?.popViewControllerAnimated(true);
//    }
//    @IBAction func AddOnclick(sender: UIButton) {
//        if(related_dataState==0){
//            if(ConsultationState == 0){
//                var trimString = String!(objTitle.text).stringByTrimmingCharactersInSet(
//                    NSCharacterSet.whitespaceAndNewlineCharacterSet());
//                if(trimString==""){
//                    print("Fill in title, please.");
//                    return;
//                    //todo: add a warning sentance before
//                }
//                else{
//                    var obj:related_data = related_data();
//                    obj.data=String!(objTitle.text);
//                    if(Descripsion.text != ""){
//                        obj.remark=Descripsion.text;
//                    }
//                    if(related_data_type == 6){
//                        obj.category = 6;
//                    }
//                    if(related_data_type == 1){
//                        obj.category = 1;
//                    }
//                    else if(related_data_type == 2){
//                        obj.category = 2;
//                    }
//                    else if(related_data_type == 3){
//                        obj.category = 3;
//                    }
//                    else if(related_data_type == 4){
//                        obj.category = 4;
//                    }
//                    else if(related_data_type == 5){
//                        obj.category = 5;
//                    }
//                    related_dataList.append(obj);
//                    self.navigationController?.popViewControllerAnimated(true);
//                }
//            }
//            else if(ConsultationState == 1){
//                var trimString = String!(objTitle.text).stringByTrimmingCharactersInSet(
//                    NSCharacterSet.whitespaceAndNewlineCharacterSet());
//                if(trimString==""){
//                    print("Fill in title, please.");
//                    return;
//                    //todo: add a warning sentance before
//                }
//                else{
//                    var obj:related_data = related_data();
//                    obj.consultation_id = currentVisit.consultation.consultation_id;
//                    obj.data=String!(objTitle.text);
//                    if(Descripsion.text != ""){
//                        obj.remark=Descripsion.text;
//                    }
//                    if(related_data_type == 6){
//                        obj.category = 6;
//                    }
//                    if(related_data_type == 1){
//                        obj.category = 1;
//                    }
//                    else if(related_data_type == 2){
//                        obj.category = 2;
//                    }
//                    else if(related_data_type == 3){
//                        obj.category = 3;
//                    }
//                    else if(related_data_type == 4){
//                        obj.category = 4;
//                    }
//                    else if(related_data_type == 5){
//                        obj.category = 5;
//                    }
//                    related_dataList.append(obj);
//                    new_related_dataList.append(obj);
//                    new_related_data=1;
//                    self.navigationController?.popViewControllerAnimated(true);
//                }
//            }
//        }
//        else if(related_dataState==1){
//            if(ConsultationState==0){
//                if(objTitle.text != ""){
//                    for(var i=0; i<related_dataList.count ; i++){
//                        if(related_dataList[i].rd_id==currentRelatedData.rd_id){
//                            related_dataList[i].data=String!(objTitle.text);
//                            related_dataList[i].remark=Descripsion.text;
//                            break;
//                        }
//                    }
//                }
//                self.navigationController?.popViewControllerAnimated(true);
//            }
//            else if(ConsultationState==1){
//                var obj:related_data = related_data();
//                obj.consultation_id = currentVisit.consultation.consultation_id;
//                obj.rd_id = currentRelatedData.rd_id;
//                obj.category = currentRelatedData.category;
//                if(objTitle.text != ""){
//                    obj.data = String!(objTitle.text);
//                    obj.remark = Descripsion.text;
//                    for(var i=0; i<related_dataList.count ; i++){
//                        if(related_dataList[i].rd_id==obj.rd_id){
//                            related_dataList[i].data=obj.data;
//                            related_dataList[i].remark=obj.remark;
//                            break;
//                        }
//                    }
//                    modified_related_dataList.append(obj);
//                    modified_related_data=1;
//                }
//                self.navigationController?.popViewControllerAnimated(true);
//            }
//        }
//        //        for(var i = 0; i<related_dataList.count;i++){
//        //            print("\(related_dataList[i].data) , \(related_dataList[i].remark) ,  \(String(related_dataList[i].category))" )
//        //        }
//    }
//}




//for key in patientsjson.keys{
//    if(patientsjson[key]!as? String=="NULL"){
//        patientsjson.removeValueForKey(key)
//    }
//    else if(patientsjson[key]!as? String=="0"){
//        patientsjson.removeValueForKey(key)
//    }
//}
//
//
//
//
//for key in visitsjson.keys{
//    if(visitsjson[key]!as? String=="NULL"){
//        visitsjson.removeValueForKey(key)
//    }
//    else if(visitsjson[key]!as? String=="0"){
//        visitsjson.removeValueForKey(key)
//    }
//}
//
//
//for key in triagesjson.keys{
//    if(triagesjson[key]!as? String=="NULL"){
//        triagesjson.removeValueForKey(key)
//    }
//    else if(triagesjson[key]!as? String=="0"){
//        triagesjson.removeValueForKey(key)
//    }
//}