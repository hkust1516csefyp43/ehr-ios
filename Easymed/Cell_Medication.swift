//
//  Cell_Triage.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 9/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation
import UIKit

class Cell_Medication: UITableViewCell {
    

    @IBOutlet weak var Switch: UILabel!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
