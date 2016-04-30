//
//  ViewController.swift
//  Easymed
//
//  Created by choi chun ho,chchoiac,20124979 on 1/4/16.
//  Copyright © 2016 John. All rights reserved.
//
//for key in headers.keys{
//    if(headers[key]!as String=="NULL"){
//        headers.removeValueForKey(key)
//    }
//}
import UIKit;
import Alamofire;

class LoginViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate{
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var piSwitch: UISwitch!
    @IBOutlet weak var ClinicButton: UIButton!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var ConfirmButton: UIButton!
    @IBOutlet weak var warningImage: UIImageView!
    var got_genders = 0;
    var got_medications = 0;
    var count=0;
    override func viewDidLoad() {

//        var searchDate:String;
//        if(currentmonth<10){
//         searchDate="\(currentyear)-0\(currentmonth)-\(currentDay)";
//        }
//        else{
//         searchDate="\(currentyear)-\(currentmonth)-\(currentDay)";
//        }
//        var abc="2016-04-29T07:58:24.612Z";
//        print(searchDate);
//        print(abc.rangeOfString("2016-04-29"));
//
//        let headers = [
//            "token": token,
//        ]
//        var visitsURL: String = "\(Path)visits";
//        Alamofire.request(.GET, visitsURL, parameters: nil, encoding: .URL, headers: headers).responseJSON { (Response) -> Void in
//            if let visitJSON = Response.result.value{
//                for(var i=0;i<visitJSON.count;i++){
//                    if let y=visitJSON[i]["create_timestamp"]as? String{
//                         print("\(y)")
//                        if y.rangeOfString(searchDate) != nil{
//                            print("\(y)")
//                        }
//                    }
//                }
//            }
//        }
        self.icon.image = UIImage(named: "icon");
        
        //switch
        if(Path==Path_Heroku){
            piSwitch.on=false;
        }
        else{
            piSwitch.on=true;
        }
        
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
        
        
        //here
         self.warningImage.image = UIImage(named: "warning");
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
        warningImage.hidden=true;
        warningImage.userInteractionEnabled = true
        warningImage.addGestureRecognizer(tapGestureRecognizer)
    
    }
    func imageTapped(img: AnyObject)
    {
        warningImage.hidden=true;
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
        CurrentClinic = clinicsList[picker.selectedRowInComponent(0)].clinic_id;
    }
    
    @IBAction func ClinicOnclick(sender: UIButton) {
        self.view.viewWithTag(1)?.hidden = false;
        self.view.viewWithTag(2)?.hidden = false;
    }
    @IBAction func ConfirmOnclick(sender: UIButton) {
        self.view.viewWithTag(1)?.hidden = true;
        self.view.viewWithTag(2)?.hidden = true;
        print("Current clinic id: \(CurrentClinic)");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func piSwitchValueChange(sender: UISwitch) {
        if(piSwitch.on){
            Path=Path_Pi;
        }
        else{
            Path=Path_Heroku;
        }
    }
    
    @IBAction func PasswordChange(sender: UITextField) {
        let Password:String = String!(PasswordTextField.text);
        var returnSTR="";
        for(var i=0;i<Password.length;i++){
            returnSTR=returnSTR+"*";
        }
        PasswordTextField.text=returnSTR;
    }
    
    @IBAction func LoginOnclick(sender: UIButton) {
        if(self.count==0){
            warningImage.hidden=false;
            self.count++;
            return
        }
        let Username:String = String!(UsernameTextField.text);
        let Password:String = String!(PasswordTextField.text);
        
        //call api to submit username and password
        print("\(Username) , \(Password)")
        
        if(1==1){ //token correct
            let headers = [
                "token": token,
            ];
            
            let tempPath_medications=Path;
            
            let medicationsURL: String = "\(Path)medications";
            
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
                    if(self.got_genders==1){
                    self.performSegueWithIdentifier("Login_MainMenu", sender: self);
                    }
                    else{
                        self.got_medications=1;
                    }
                }
                else{
                    print("Fail: Get medications tuple at \(tempPath_medications)");
                    self.backup_Getmedications(tempPath_medications);
                }
            }
            
            let tempPath_genders=Path;
            
            let gendersURL: String = "\(Path)genders";
            print("GET: \(gendersURL)");
            Alamofire.request(.GET, gendersURL, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
                if let JSON = Response.result.value{
                    print(JSON.count);
                    gendersList.removeAll();
                    var tempList:[gender] = [gender]();
                    for(var i=0 ; i<JSON.count ; i++){
                        var obj:gender = gender();
                        obj.gender_id = JSON[i]["gender_id"]as! String;
                        obj.description = JSON[i]["description"]as! String;
                        tempList.append(obj);
                    }
                    gendersList.append(tempList);
                    if(self.got_medications==1){
                self.performSegueWithIdentifier("Login_MainMenu", sender: self);
                    }
                    else{
                        self.got_genders=1;
                    }
                }
                else{
                    print("Fail: Get genders tuple at \(tempPath_genders)");
                    self.backup_Getgenders(tempPath_genders);
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
    
    func backup_Getgenders(CurrentPath:String){
        
        switchPath(CurrentPath);
        
        let headers = [
            "token": token,
        ];
        
        let gendersURL: String = "\(Path)genders";
        
        print("GET: \(gendersURL)");
        
        Alamofire.request(.GET, gendersURL, encoding: .JSON, headers: headers).responseJSON { (Response) -> Void in
            if let JSON = Response.result.value{
                gendersList.removeAll();
                var tempList:[gender] = [gender]();
                for(var i=0 ; i<JSON.count ; i++){
                    var obj:gender = gender();
                    obj.gender_id = JSON[i]["gender_id"]as! String;
                    obj.description = JSON[i]["description"]as! String;
                    tempList.append(obj);
                }
                gendersList.append(tempList);
                if(self.got_medications==1){
                    self.performSegueWithIdentifier("Login_MainMenu", sender: self);
                }
                else{
                    self.got_genders=1;
                    
                }
            }
            else{
                print("Fail: Get genders tuple");
                
            }
        }
    }
    
    func backup_Getmedications(CurrentPath:String){
        
        switchPath(CurrentPath);
        
        let headers = [
            "token": token,
        ];
        
        
        let medicationsURL: String = "\(Path)medications";
        
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
                if(self.got_genders==1){
                    self.performSegueWithIdentifier("Login_MainMenu", sender: self);
                }
                else{
                   self.got_medications=1;
                }
            }
            else{
                print("Fail: Get medications tuple at \(Path)");
            }
        }
    }
}

extension UIViewController {
    func switchPath(Current:String){
        if Current == Path_Heroku{
            Path=Path_Pi;
        }
        else{
            Path = Path_Heroku;
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
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
extension Dictionary where Value: AnyObject {
    
    var nullsRemoved: [Key: Value] {
        let tup = filter { !($0.1 is NSNull) }
        return tup.reduce([Key: Value]()) { (var r, e) in r[e.0] = e.1; return r }
    }
}
extension String {
    var length: Int {
        return characters.count
    }
}
