//
//  ClassCell.swift
//  CLCGrindsetApp
//
//  Created by RYAN STARK on 4/24/25.
//

import Foundation
import UIKit

class ClassCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    
    func con(name: String, id: String)
    {
        nameLabel.text = name
        idLabel.text = id
    }
}
