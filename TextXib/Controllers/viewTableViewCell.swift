//
//  viewTableViewCell.swift
//  TextXib
//
//  Created by Zaggle on 27/09/22.
//

import UIKit

class viewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var buttonCell: UIButton!
    
    var txt:String = ""
    var ClousureBtnActionHandler:((_ sender: UIButton) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        buttonCell.setTitle("\(txt)th Button", for: .normal)
        // Configure the view for the selected state
    }
    
    
    @IBAction func navPageView(_ sender: UIButton) {
        print("work")
        if self.ClousureBtnActionHandler != nil {
                    self.ClousureBtnActionHandler!(sender)
                }
    }
    
    
}
