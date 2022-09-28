//
//  NaviViewController.swift
//  TextXib
//
//  Created by Zaggle on 28/09/22.
//

import UIKit

class NaviViewController: UIViewController {
    var val:String = ""
    
    
    @IBOutlet weak var naviLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        naviLabel.text = val;
        // Do any additional setup after loading the view.
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
