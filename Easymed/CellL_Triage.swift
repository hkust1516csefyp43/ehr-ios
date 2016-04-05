//
//  Cell_Triage.swift
//  PassingData
//
//  Created by choi chun ho,chchoiac,20124979 on 9/3/16.
//  Copyright © 2016 John. All rights reserved.
//

import Foundation
import UIKit

class CellL_Triage: UITableViewCell {
    
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var DetailLabel: UILabel!
    @IBOutlet weak var CountryLabel: UILabel!
//    @IBOutlet weak var NameLabel: UILabel!
//    @IBOutlet weak var DetailLabel: UILabel!
//    @IBOutlet weak var CountryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //
        // Configure the view for the selected state
    }
    
}
