//
//  ButtonViewController.swift
//  TextXib
//
//  Created by Zaggle on 22/09/22.
//

import UIKit

class ButtonViewController: UIViewController {

    @IBOutlet weak var LargeSqareButton: UIButton!
    @IBOutlet weak var RoundedButton: UIButton!
    @IBOutlet weak var NormalButton: UIButton!
    
    @IBOutlet weak var ButtonLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        view.backgroundColor = .yellow
       ButtonLable.backgroundColor = .green
//        RoundedButton.center = NormalButton.center
//        RoundedButton.frame = CGRect(x: NormalButton.frame.midX, y: NormalButton.frame.midY+20, width: 60, height: 60)
        RoundedButton.layer.cornerRadius = 0.5 * RoundedButton.bounds.size.width
        ButtonLable.layer.cornerRadius = RoundedButton.layer.cornerRadius
//        RoundedButton.backgroundColor = .green
        NormalButton.layer.cornerRadius = 10
        NormalButton.backgroundColor = .gray
        
        NormalButton.layer.borderColor = UIColor.blue.cgColor
        LargeSqareButton.layer.borderColor = UIColor.purple.cgColor
        LargeSqareButton.layer.borderWidth = 3
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
