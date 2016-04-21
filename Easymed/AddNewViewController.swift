//
//  File.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation;
import UIKit;
import Alamofire;

class AddNewViewController: UIViewController {
    
    @IBOutlet weak var objTitle: UITextView!
    @IBOutlet weak var Descripsion: UITextView!
    @IBOutlet weak var delete: UIButton!
    
    override func viewDidLoad() {
        if(related_dataState == 1){
            delete.enabled=true;
            objTitle.text = currentRelatedData.data;
            if(currentRelatedData.remark != "NULL"){
                Descripsion.text = currentRelatedData.remark;
            }
        }
        super.viewDidLoad()
    }
    
    @IBAction func DeleteOnclick(sender: UIButton) {
        if(ConsultationState == 1){
            var obj:related_data = related_data();
            obj.rd_id = related_dataList[Int(currentRelatedData.rd_id)!].rd_id;
            deleted_related_dataList.append(obj);
            deleted_related_data = 1;
        }
        related_dataList.removeAtIndex(Int(currentRelatedData.rd_id)!);
        self.navigationController?.popViewControllerAnimated(true);
    }
    @IBAction func AddOnclick(sender: UIButton) {
        if(related_dataState==0){
            if(ConsultationState == 0){
                if(objTitle.text==""){
                    print("Fill in title, please.");
                }
                else{
                    var obj:related_data = related_data();
                    obj.data=objTitle.text;
                    if(Descripsion.text != ""){
                        obj.remark=Descripsion.text;
                    }
                    if(related_data_type == 1){
                         obj.category = 1;
                    }
                    else if(related_data_type == 2){
                         obj.category = 2;
                    }
                    else if(related_data_type == 3){
                         obj.category = 3;
                    }
                    else if(related_data_type == 4){
                        obj.category = 4;
                    }
                    else if(related_data_type == 5){
                         obj.category = 5;
                    }
                    related_dataList.append(obj);
                    self.navigationController?.popViewControllerAnimated(true);
                }
            }
            else if(ConsultationState == 1){
                if(objTitle.text==""){
                    print("Fill in title, please.");
                }
                else{
                    var obj:related_data = related_data();
                    obj.consultation_id = currentVisit.consultation.consultation_id;
                    obj.data=objTitle.text;
                    if(Descripsion.text != ""){
                        obj.remark=Descripsion.text;
                    }
                    if(related_data_type == 1){
                         obj.category = 1;
                    }
                    else if(related_data_type == 2){
                        obj.category = 2;
                    }
                    else if(related_data_type == 3){
                        obj.category = 3;
                    }
                    else if(related_data_type == 4){
                        obj.category = 4;
                    }
                    else if(related_data_type == 5){
                        obj.category = 5;
                    }
                    related_dataList.append(obj);
                    new_related_dataList.append(obj);
                    new_related_data=1;
                    self.navigationController?.popViewControllerAnimated(true);
                }
            }
        }
        else if(related_dataState==1){
            if(ConsultationState==0){
                if(objTitle.text != ""){
                    related_dataList[Int(currentRelatedData.rd_id)!].data=objTitle.text;
                    related_dataList[Int(currentRelatedData.rd_id)!].remark=Descripsion.text;
                }
                self.navigationController?.popViewControllerAnimated(true);
            }
            else if(ConsultationState==1){
                var obj:related_data = related_data();
                obj.consultation_id = currentVisit.consultation.consultation_id;
                obj.rd_id = currentRelatedData.rd_id;
                obj.category = currentRelatedData.category;
                if(objTitle.text != ""){
                    obj.data = objTitle.text;
                    obj.remark = Descripsion.text;
                    for(var i=0; i<related_dataList.count ; i++){
                        if(related_dataList[i].rd_id==obj.rd_id){
                            related_dataList[i].data=obj.data;
                            related_dataList[i].remark=obj.remark;
                            break;
                        }
                    }
                    modified_related_dataList.append(obj);
                    modified_related_data=1;
                }
                self.navigationController?.popViewControllerAnimated(true);
            }
        }
//        for(var i = 0; i<related_dataList.count;i++){
//            print("\(related_dataList[i].data) , \(related_dataList[i].remark) ,  \(String(related_dataList[i].category))" )
//        }
    }
}