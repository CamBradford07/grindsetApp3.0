//
//  ClassCell.swift
//  CLCGrindsetApp
//
//  Created by RYAN STARK on 4/24/25.
//

import Foundation
import UIKit

class ClassCellSpecific: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var creditsLabel: UILabel!
    
    
    func con(name: String, id: String, cred: String)
    {
        nameLabel.text = name
        idLabel.text = id
        creditsLabel.text = "Credits: \(cred)"
    }
}
