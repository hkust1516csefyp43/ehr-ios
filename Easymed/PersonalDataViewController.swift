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

class PersonalDataViewController : UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate  {
    
    @IBOutlet weak var VerticalScrollView: UIScrollView!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var Gender: UILabel!
    @IBOutlet weak var Status: UILabel!
    @IBOutlet weak var Birthday: UILabel!
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var CameraButton: UIButton!
    @IBOutlet weak var LibraryButton: UIButton!
    @IBOutlet weak var imageDisplay: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.hideKeyboardWhenTappedAround()
        LastName.delegate=self;
        FirstName.delegate=self;
        Address.delegate=self;
        PhoneNumber.delegate=self
        
        VerticalScrollView.contentSize.height=1100;
        if(AddVisitState==1||AddVisitState==2){
            //step1: Set text
            edit_patient = 0;
            edit_triage = 0;
            LastName.text=currentVisit.patient.last_name;
            FirstName.text=currentVisit.patient.first_name;
            switch(currentVisit.patient.gender_id){
            case "0":
                Gender.text="Male";
            case "1":
                Gender.text="Female";
            case "2":
                Gender.text="Custom";
            default:
                Gender.text="Undisclosed";
            }
            Birthday.text="\(currentVisit.patient.birth_date) / \(currentVisit.patient.birth_month) / \(currentVisit.patient.birth_year)"
            Address.text=currentVisit.patient.address;
            PhoneNumber.text=String(currentVisit.patient.phone_number);
        }
        else if(AddVisitState==0){
            Gender.text = "Undisclosed";
            Birthday.text = "dd/mm/yyyy"
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
        let imageData = UIImagePNGRepresentation(imageToConvert.imageRotatedByDegrees(90, flip: false));
        let base64String = imageData!.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
        let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
        let decodedimage = UIImage(data: decodedData!);
        imageDisplay.image = decodedimage! as UIImage
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
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
}