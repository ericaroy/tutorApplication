//
//  TutorTableViewCell.swift
//  TheTutorApp
//
//  Created by Erica Roy on 5/28/17.
//  Copyright © 2017 Erica Roy. All rights reserved.
//

import UIKit

class TutorTableViewCell: UITableViewCell {

 
    @IBOutlet weak var tutorImage: UIImageView!
   
    @IBOutlet weak var tutorProgram: UILabel!
    @IBOutlet weak var tutorName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
