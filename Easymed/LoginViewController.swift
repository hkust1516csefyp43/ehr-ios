//
//  ViewController.swift
//  Easymed
//
//  Created by choi chun ho,chchoiac,20124979 on 1/4/16.
//  Copyright © 2016 John. All rights reserved.
//

import UIKit;
import Alamofire;

class LoginViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate{
    
    @IBOutlet weak var ClinicButton: UIButton!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var ConfirmButton: UIButton!
    
    override func viewDidLoad() {
        //keyboard
        self.hideKeyboardWhenTappedAround()
        UsernameTextField.delegate=self;
        PasswordTextField.delegate=self;
        
        //ui
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        picker.tag=1;
        ConfirmButton.tag=2;
        UsernameTextField.text=nil;
        PasswordTextField.text=nil;
        
        //                let related_datajson : [String: AnyObject] = [
        //                    "data": "MODIFIED",
        //                    "remark": "MODIFIED",
        //                ];
        //        let related_dataheaders = [
        //            "token": token,
        //                    "Content-Type": "application/json"
        //        ];
        //        let prescriptionsjson : [String: AnyObject] = [
        //            "prescription_detail": "modified_details",
        //            "prescribed": 0
        //        ];
        //        let prescriptionsheaders = [
        //            "token": token,
        //            "Content-Type": "application/json"
        //        ];
        //        let prescriptionsURL: String = "http://ehr-api.herokuapp.com/v2/prescriptions/RcVcK8FVbZ3G4KYH";
        //        print("PUT: \(prescriptionsURL)");
        //        Alamofire.request(.PUT, prescriptionsURL, parameters: prescriptionsjson, encoding: .JSON, headers: prescriptionsheaders).responseJSON { (Response) -> Void in
        //            if let prescriptionsJSON = Response.result.value{
        //                print("success")
        //            }
        //            else{
        //                print("fail: PUT prescripsion")
        //            }
        //        }
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return clinicsNameList.count
    }
    
    func pickerView(
        pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
        ) -> Int {
            return clinicsNameList[component].count
    }
    
    func pickerView(
        pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
        ) -> String? {
            return clinicsNameList[component][row]
    }
    
    func pickerView(
        pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int)
    {
        updateLabel()
    }
    func updateLabel(){
        let clinic = clinicsNameList[0][picker.selectedRowInComponent(0)]
        ClinicButton.setTitle("\(clinic)", forState: .Normal);
        this_clinic_id = clinicsList[picker.selectedRowInComponent(0)].clinic_id;
    }
    
    @IBAction func ClinicOnclick(sender: UIButton) {
        self.view.viewWithTag(1)?.hidden = false;
        self.view.viewWithTag(2)?.hidden = false;
    }
    @IBAction func ConfirmOnclick(sender: UIButton) {
        self.view.viewWithTag(1)?.hidden = true;
        self.view.viewWithTag(2)?.hidden = true;
        print("Current clinic id: \(this_clinic_id)");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func LoginOnclick(sender: UIButton) {
        let Username:String = String!(UsernameTextField.text);
        let Password:String = String!(PasswordTextField.text);
        
        //call api to submit username and password
        print("\(Username) , \(Password)")
        
        if(1==1){ //token correct
            var got_genders = 0;
            var got_medications = 0;
            let headers = [
                "token": token,
            ];
            let medicationsURL: String = "http://ehr-api.herokuapp.com/v2/medications";
            print("GET: \(medicationsURL)");
            Alamofire.request(.GET, medicationsURL, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
                if let JSON = Response.result.value{
                    medicationsList.removeAll();
                    for(var i=0 ; i<JSON.count ; i++){
                        var obj:medications = medications();
                        obj.medication_id = JSON[i]["medication_id"]as! String;
                        obj.user_id = JSON[i]["user_id"]as! String;
                        obj.medication = JSON[i]["medication"]as! String;
                        medicationsList.append(obj);
                    }
                    if(got_genders==1){
                    self.performSegueWithIdentifier("Login_MainMenu", sender: self);
                    }
                    else{
                        got_medications=1;
                    }
                }
                else{
                    print("Fail: Get medications tuple");
                }
            }
            let gendersURL: String = "http://ehr-api.herokuapp.com/v2/genders";
            print("GET: \(gendersURL)");
            Alamofire.request(.GET, gendersURL, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
                if let JSON = Response.result.value{
                    gendersList.removeAll();
                    for(var i=0 ; i<JSON.count ; i++){
                        var obj:genders = genders();
                        obj.gender_id = JSON[i]["gender_id"]as! String;
                        obj.description = JSON[i]["description"]as! String;
                        gendersList.append(obj);
                    }
                    if(got_medications==1){
                        self.performSegueWithIdentifier("Login_MainMenu", sender: self);
                    }
                    else{
                        got_genders=1;
                    }
                }
                else{
                    print("Fail: Get genders tuple");
                }
            }

        }
        else{ //login problem incorrect
            
        };
    }
    
    //keyboard
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    

}

extension UIImage {
    public func imageRotatedByDegrees(degrees: CGFloat, flip: Bool) -> UIImage {
        let radiansToDegrees: (CGFloat) -> CGFloat = {
            return $0 * (180.0 / CGFloat(M_PI))
        }
        let degreesToRadians: (CGFloat) -> CGFloat = {
            return $0 / 180.0 * CGFloat(M_PI)
        }
        
        // calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox = UIView(frame: CGRect(origin: CGPointZero, size: size))
        let t = CGAffineTransformMakeRotation(degreesToRadians(degrees));
        rotatedViewBox.transform = t
        let rotatedSize = rotatedViewBox.frame.size
        
        // Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        CGContextTranslateCTM(bitmap, rotatedSize.width / 2.0, rotatedSize.height / 2.0);
        
        //   // Rotate the image context
        CGContextRotateCTM(bitmap, degreesToRadians(degrees));
        
        // Now, draw the rotated/scaled image into the context
        var yFlip: CGFloat
        
        if(flip){
            yFlip = CGFloat(-1.0)
        } else {
            yFlip = CGFloat(1.0)
        }
        
        CGContextScaleCTM(bitmap, yFlip, -1.0)
        CGContextDrawImage(bitmap, CGRectMake(-size.width / 2, -size.height / 2, size.width, size.height), CGImage)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
