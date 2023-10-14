//
//  MyTableViewCell.swift
//  Weather_Assignment
//
//  Created by Amit on 14/10/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var degreeLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
