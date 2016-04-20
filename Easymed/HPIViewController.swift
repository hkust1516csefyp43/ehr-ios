

import Foundation;
import UIKit;
import Alamofire;

class HPIViewController : UIViewController {
    
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var ScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ScrollView.contentSize.height=1500;
    }
    func textViewDidChange(textView: UITextView) {
//        currentVisit.triage.chiefComplains=String!(chiefComplain.text);
//        edit_triage=1;
    }

}
