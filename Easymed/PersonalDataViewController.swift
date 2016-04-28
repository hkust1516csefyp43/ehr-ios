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

var dateList:[[Int]]=[[Int]]();
var monthList:[[Int]]=[[Int]]();
var yearList:[[Int]]=[[Int]]();
class PersonalDataViewController : UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var VerticalScrollView: UIScrollView!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var MiddleName: UITextField! // here
    @IBOutlet weak var NativeName: UITextField!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var Tag: UIButton!  //
    @IBOutlet weak var TagPicker: UIPickerView!
    @IBOutlet weak var TagConfirm: UIButton!
    @IBOutlet weak var Gender: UIButton! //
    @IBOutlet weak var GenderPicker: UIPickerView!
    @IBOutlet weak var GenderConfirm: UIButton!
    @IBOutlet weak var Birthday: UIButton! //
    @IBOutlet weak var BirthdayConfirm: UIButton!
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var CameraButton: UIButton!
    @IBOutlet weak var LibraryButton: UIButton!
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var DatePicker: UIPickerView!
    @IBOutlet weak var MonthPicker: UIPickerView!
    @IBOutlet weak var YearPicker: UIPickerView!
    
    override func viewDidLoad() {
        initialize();
        TagPicker.delegate = self
        TagPicker.dataSource = self
        GenderPicker.delegate = self
        GenderPicker.dataSource = self
        DatePicker.delegate = self
        DatePicker.dataSource = self
        MonthPicker.delegate = self
        MonthPicker.dataSource = self
        YearPicker.delegate = self
        YearPicker.dataSource = self
        
        TagPicker.tag = 1;
        TagConfirm.tag = 2;
        GenderPicker.tag = 3;
        GenderConfirm.tag = 4;
         DatePicker.tag = 5;
        MonthPicker.tag = 6;
        YearPicker.tag = 7;
        BirthdayConfirm.tag = 8;
        
        if(currentStage != 1){
            CameraButton.hidden = true;
            LibraryButton.hidden = true;
        }
        edit_attachments=0;
        super.viewDidLoad();
        self.hideKeyboardWhenTappedAround()
        LastName.delegate=self;
        FirstName.delegate=self;
        MiddleName.delegate=self;
        NativeName.delegate=self;
        Address.delegate=self;
        PhoneNumber.delegate=self
        
        VerticalScrollView.contentSize.height=1500;
        if(AddVisitState==1||AddVisitState==2){
            //setpicture
            if (currentVisit.patient.image_id != "NULL"){
                for(var i=0; i<attachmentsList.count ; i++){
                    if(currentVisit.patient.image_id == attachmentsList[i].attachment_id){
                        if(attachmentsList[i].file_in_base64.characters.count>40){
                            let base64:String=attachmentsList[i].file_in_base64;
                            let decodedData = NSData(base64EncodedString: base64, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
                            let decodedimage = UIImage(data: decodedData!);
                            imageDisplay.image = decodedimage! as UIImage
                            break;
                        }
                        else{
                            imageDisplay.image = UIImage(named: "defaultPatient");
                            break;
                        }
                    }
                }
            }
            else{
                imageDisplay.image = UIImage(named: "defaultPatient");
            }
            
            //step1: Set text
            edit_patient = 0;
            edit_triage = 0;
            Tag.setTitle("\(currentVisit.tag)", forState: .Normal);
            LastName.text=currentVisit.patient.last_name;
            MiddleName.text=currentVisit.patient.middle_name;
            FirstName.text=currentVisit.patient.first_name;
            NativeName.text=currentVisit.patient.natvie_name;
            for(var i=0; i<gendersList[0].count ;i++){
                if(currentVisit.patient.gender_id==gendersList[0][i].gender_id){
                       Gender.setTitle("\(gendersList[0][i].description)", forState: .Normal);
                }
            }
            for(var i = 0;i<gendersList[0].count;i++){
                if(currentVisit.patient.gender_id == gendersList[0][i].description){
            Gender.setTitle("\(gendersList[0][i].description)", forState: .Normal);
                    break;
                }
            }
            Birthday.setTitle("\(currentVisit.patient.birth_date) / \(currentVisit.patient.birth_month) / \(currentVisit.patient.birth_year)", forState: .Normal);
            Address.text=currentVisit.patient.address;
            PhoneNumber.text=String(currentVisit.patient.phone_number);
        }
        else if(AddVisitState==0){
                        Birthday.setTitle("Click here to add birth-date", forState: .Normal);
            imageDisplay.image = UIImage(named: "defaultPatient");
        }
        else{
            print("error: variable 'AddVisitState'");
        }
    }
    @IBAction func FirstNameOnChange(sender: UITextField) {
        currentVisit.patient.first_name=String!(FirstName.text);
        edit_patient=1;
    }
    
    @IBAction func LsstNameOnChange(sender: UITextField) {
        currentVisit.patient.last_name=String!(LastName.text);
        edit_patient=1;
    }
    @IBAction func NativeNameOnchange(sender: AnyObject) {
        currentVisit.patient.natvie_name=String!(NativeName.text);
        edit_patient=1;
    }
    @IBAction func MiddleNameOnchange(sender: UITextField) {
        currentVisit.patient.middle_name=String!(MiddleName.text);
        edit_patient=1;
    }
    
    @IBAction func AddressOnChange(sender: UITextField) {
        currentVisit.patient.address=String!(Address.text);
        edit_patient=1;
    }
    
    @IBAction func PhoneNumberOnChange(sender: UITextField) {
        currentVisit.patient.phone_number=String!(PhoneNumber.text);
        edit_patient=1;
    }
    
    //ImageView use for following 4 functions (CameraOnclick, LibraryOnclick,imagePickerController,cropToBounds)
    
    @IBAction func CameraOnclick(sender: UIButton) {
        let picker = UIImagePickerController();
        picker.delegate=self;
        picker.sourceType = .Camera;
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func LibraryOnclick(sender: UIButton) {
        let picker = UIImagePickerController();
        picker.delegate=self;
        picker.sourceType = .PhotoLibrary;
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let imageToConvert=cropToBounds((info[UIImagePickerControllerOriginalImage]as?UIImage)!,width: 364,height: 364);
        let resize_imageToConvert=resizeImage(imageToConvert, newWidth: 100);
        let imageData = UIImagePNGRepresentation(resize_imageToConvert.imageRotatedByDegrees(0, flip: false));
        let base64String = imageData!.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
        currentAttachments.file_in_base64=base64String;
        let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
        let decodedimage = UIImage(data: decodedData!);
        imageDisplay.image = decodedimage! as UIImage
        if(AddVisitState==0){
        edit_attachments = 1;
        }
        else {
            if(currentVisit.patient.image_id=="NULL"){
                edit_attachments = 1;
                edit_patient = 1;
            }
            else{
                edit_attachments = 2;
            }
        }
        dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
        
        let contextImage: UIImage = UIImage(CGImage: image.CGImage!)
        
        let contextSize: CGSize = contextImage.size
        
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)
        
        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }
        
        let rect: CGRect = CGRectMake(posX, posY, cgwidth, cgheight)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImageRef = CGImageCreateWithImageInRect(contextImage.CGImage, rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(CGImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        
        return image
    }
    //keyboard
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    //picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if(pickerView==GenderPicker){
            return gendersList.count;
        }
        else if(pickerView==TagPicker){
            return TagList.count;
        }
        else if(pickerView==DatePicker){
            return dateList.count;
        }
        else if(pickerView==MonthPicker){
            return monthList.count;
        }
        else if(pickerView==YearPicker){
            return yearList.count;
        }
        return 0;
    }
    
    func pickerView(
        pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
        ) -> Int {
            if(pickerView==TagPicker){
                return TagList[component].count;
            }
            else if(pickerView==GenderPicker){
                return gendersList[component].count;
            }
            else if(pickerView==DatePicker){
                return dateList[component].count;
            }
            else if(pickerView==MonthPicker){
                return monthList[component].count;
            }
            else if(pickerView==YearPicker){
                return yearList[component].count;
            }
            return 0;
    }
    
    func pickerView(
        pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
        ) -> String? {
            if(pickerView==GenderPicker){
                return gendersList[component][row].description;
            }
            else if(pickerView==TagPicker){
                return  String(TagList[component][row]);
            }
            else if(pickerView==DatePicker){
                return String(dateList[component][row]);
            }
            else if(pickerView==MonthPicker){
                return String(monthList[component][row]);
            }
            else if(pickerView==YearPicker){
                return String(yearList[component][row]);
            }
            return "ERROR";
    }
    
    func pickerView(
        pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int)
    {
        if(pickerView==GenderPicker){
            updateGender();
        }
        else if(pickerView==TagPicker){
            updateTag();
        }
        else if(pickerView==DatePicker){
            updateDate()
        }
        else if(pickerView==MonthPicker){
            updateMonth()
        }
        else if(pickerView==YearPicker){
            updateYear()
        }
    }
    
    func updateTag(){
        let TagNum = TagList[0][TagPicker.selectedRowInComponent(0)]
        Tag.setTitle("\(TagNum)", forState: .Normal);
        currentVisit.tag = TagNum;
        edit_patient=1;
    }
    
    func updateGender(){
        let GenderChosen = gendersList[0][GenderPicker.selectedRowInComponent(0)]
        Gender.setTitle("\(GenderChosen.description)", forState: .Normal);
        currentVisit.patient.gender_id = GenderChosen.gender_id;
        edit_patient=1;
    }
    
    func updateDate(){
        let Chosen = dateList[0][DatePicker.selectedRowInComponent(0)]
        Birthday.setTitle("\(Chosen)-\(currentVisit.patient.birth_month)-\(currentVisit.patient.birth_year)", forState: .Normal);
        currentVisit.patient.birth_date = Chosen;
        edit_patient=1;
    }
    func updateMonth(){
        let Chosen = monthList[0][MonthPicker.selectedRowInComponent(0)]
        Birthday.setTitle("\(currentVisit.patient.birth_date)-\(Chosen)-\(currentVisit.patient.birth_year)", forState: .Normal);
        currentVisit.patient.birth_month = Chosen;
        edit_patient=1;
    }
    func updateYear(){
        let Chosen = yearList[0][YearPicker.selectedRowInComponent(0)]
        Birthday.setTitle("\(currentVisit.patient.birth_date)-\(currentVisit.patient.birth_month)-\(Chosen)", forState: .Normal);
        currentVisit.patient.birth_year = Chosen;
        edit_patient=1;
    }

    //ui
    @IBAction func TagOnclick(sender: AnyObject) {
        Tag.userInteractionEnabled = false;
        Gender.userInteractionEnabled = true;
        Birthday.userInteractionEnabled = true;
        self.view.viewWithTag(1)?.hidden = false;
        self.view.viewWithTag(2)?.hidden = false;
        self.view.viewWithTag(3)?.hidden = true;
        self.view.viewWithTag(4)?.hidden = true;
        self.view.viewWithTag(5)?.hidden = true;
        self.view.viewWithTag(6)?.hidden = true;
        self.view.viewWithTag(7)?.hidden = true;
        self.view.viewWithTag(8)?.hidden = true;
    }
    @IBAction func TagConfirm(sender: UIButton) {
        Tag.userInteractionEnabled = true;
        self.view.viewWithTag(1)?.hidden = true;
        self.view.viewWithTag(2)?.hidden = true;
        
    }
    @IBAction func GenderOnclick(sender: UIButton) {
        Gender.userInteractionEnabled = false;
        Birthday.userInteractionEnabled = true;
        Tag.userInteractionEnabled = true;
        self.view.viewWithTag(1)?.hidden = true;
        self.view.viewWithTag(2)?.hidden = true;
        self.view.viewWithTag(5)?.hidden = true;
        self.view.viewWithTag(6)?.hidden = true;
        self.view.viewWithTag(7)?.hidden = true;
        self.view.viewWithTag(8)?.hidden = true;
        self.view.viewWithTag(3)?.hidden = false;
        self.view.viewWithTag(4)?.hidden = false;
    }
    @IBAction func GenderConfirm(sender: UIButton) {
        Gender.userInteractionEnabled = true;
        self.view.viewWithTag(3)?.hidden = true;
        self.view.viewWithTag(4)?.hidden = true;
    }
    @IBAction func BirthdayOnclick(sender: UIButton) {
        Birthday.userInteractionEnabled = false;
        Gender.userInteractionEnabled = true;
        Tag.userInteractionEnabled = true;
        self.view.viewWithTag(1)?.hidden = true;
        self.view.viewWithTag(2)?.hidden = true;
        self.view.viewWithTag(3)?.hidden = true;
        self.view.viewWithTag(4)?.hidden = true;
        self.view.viewWithTag(5)?.hidden = false;
        self.view.viewWithTag(6)?.hidden = false;
        self.view.viewWithTag(7)?.hidden = false;
        self.view.viewWithTag(8)?.hidden = false;
    }
    @IBAction func BirthdayConfirm(sender: UIButton) {
        Birthday.userInteractionEnabled = true;
        self.view.viewWithTag(5)?.hidden = true;
        self.view.viewWithTag(6)?.hidden = true;
        self.view.viewWithTag(7)?.hidden = true;
        self.view.viewWithTag(8)?.hidden = true;
    }
    func initialize(){

        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        let year =  components.year;
        
        dateList.removeAll();
        monthList.removeAll();
        yearList.removeAll();
        var tempDate : [Int]=[Int]();
        for(var i = 1;i<32;i++){
            tempDate.append(i);
        }
        dateList.append(tempDate);
        
        var tempmonth : [Int]=[Int]();
        for(var i = 1;i<13;i++){
            tempmonth.append(i);
        }
        monthList.append(tempmonth);
        
        var tempyear : [Int]=[Int]();
        for(var i = year-100;i<=year;i++){
            tempyear.append(i);
        }
        yearList.append(tempyear);
        
    }
    
    
}