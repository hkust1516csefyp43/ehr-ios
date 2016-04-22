//
//  File.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20121979 on 7/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation;
import UIKit;
import Alamofire;

class ScreeningViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var ScreeningTableView: UITableView!
    var tempList:[related_data] = [related_data]();
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewWillAppear(animated: Bool) {
        self.ScreeningTableView.reloadData();
    }
    
    //Assign number of patient in Table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count=0;
        for(var i=0; i<related_dataList.count; i++){
            if(related_dataList[i].category==1){
                count++;
            }
        }
        return count;
    }
    
    //Assign content in cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tempList = [related_data]();
        for(var i=0; i<related_dataList.count; i++){
            if(related_dataList[i].category==1){
                tempList.append(related_dataList[i]);
            }
        }
        let cell=self.ScreeningTableView.dequeueReusableCellWithIdentifier("Cell_Screening", forIndexPath: indexPath) as! Cell_Screening;
        cell.Title.text = tempList[indexPath.row].data;
        cell.Descripsion.text = tempList[indexPath.row].remark;
        return cell;
    }
    
    //Onclick Cell Action
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        //Copy target data to variable
//        tempList = [related_data]();
//        for(var i=0; i<related_dataList.count; i++){
//            if(related_dataList[i].category==1){
//                tempList.append(related_dataList[i]);
//            }
//        }
        currentRelatedData=related_data();
        if(ConsultationState==0){
            related_data_id_count=related_data_id_count+1;
            tempList[indexPath.row].rd_id = String(related_data_id_count);
            currentRelatedData.rd_id=String(related_data_id_count);
        }
        else{
         currentRelatedData.rd_id=tempList[indexPath.row].rd_id;
        }
        currentRelatedData.data=tempList[indexPath.row].data;
        currentRelatedData.remark=tempList[indexPath.row].remark;
        currentRelatedData.category = 1;
        
        print("\(currentRelatedData.rd_id) , \(currentRelatedData.data) , \(currentRelatedData.remark)")
        // GET keywords
        keywordsList.removeAll();
        let keywordsheaders = [
            "token": token,
        ];
        let keywordsURL: String = "http://ehr-api.herokuapp.com/v2/keywords?screening=1";
        print("GET: \(keywordsURL)");
        Alamofire.request(.GET, keywordsURL, encoding: .JSON, headers: keywordsheaders).responseJSON { (Response) -> Void in
            if let keywordsJSON = Response.result.value{
                for(var i=0; i<keywordsJSON.count; i++){
                    var obj:keywords = keywords();
                    if let y = keywordsJSON[i]["keyword"]as? String{
                        obj.keyword = y;
                    }
                    else{
                        print("Fail: keyword.keyword == NULL ")
                    }
                    if let y = keywordsJSON[i]["keyword_id"]as? String{
                        obj.keyword_id = y;
                    }
                    else{
                        print("Fail: keyword.keyword_id == NULL ")
                    }
                    keywordsList.append(obj);
                }
                //Change variable
                related_data_type = 1;
                related_dataState = 1;
                //Navigate to next controller
                let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AddNewViewController") as! AddNewViewController;
                self.navigationController?.pushViewController(nextViewController, animated: true);
            }
            else{
                print("Fail: GET keywords tuple");
            }
        }
    }
    
    @IBAction func addButtonOnclick(sender: UIButton) {
        keywordsList.removeAll();
        
        // GET keywords
        let keywordsheaders = [
            "token": token,
        ];
        let keywordsURL: String = "http://ehr-api.herokuapp.com/v2/keywords?screening=1";
        print("GET: \(keywordsURL)");
        Alamofire.request(.GET, keywordsURL, encoding: .JSON, headers: keywordsheaders).responseJSON { (Response) -> Void in
            if let keywordsJSON = Response.result.value{
                for(var i=0; i<keywordsJSON.count; i++){
                    var obj:keywords = keywords();
                    if let y = keywordsJSON[i]["keyword"]as? String{
                        obj.keyword = y;
                    }
                    else{
                        print("Fail: keyword.keyword == NULL ")
                    }
                    if let y = keywordsJSON[i]["keyword_id"]as? String{
                        obj.keyword_id = y;
                    }
                    else{
                        print("Fail: keyword.keyword_id == NULL ")
                    }
                    keywordsList.append(obj);
                }
                //Change variable
                related_data_type = 1;
                related_dataState = 0;
                //Navigate to next controller
                let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AddNewViewController") as! AddNewViewController;
                self.navigationController?.pushViewController(nextViewController, animated: true);
            }
            else{
                print("Fail: GET keywords tuple");
            }
        }
    }
    
}