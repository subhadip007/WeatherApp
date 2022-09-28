//
//  rootViewController.swift
//  TextXib
//
//  Created by Zaggle on 22/09/22.
//

import UIKit

class rootViewController: UIViewController {
   
   
    @IBOutlet weak var buttonView: UIButton!
    
    @IBOutlet weak var LableView: UIButton!
    
    @IBOutlet weak var TextFieldView: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonView.addTarget(self, action: #selector(click), for: .touchUpInside)
    }
    
//    @IBAction func buttonView(_sender: Any?){
//        buttonView.addTarget(self, action: #selector(click), for: .touchUpInside)
// //       buttonView.addTarget(self, action: #selector(self.click), for: .touchUpInside)
//        
//    }
    
    @objc
    func click(){
//        let vc = str.instantiateViewController(withIdentifier: "ButtonViewController") as! ButtonViewController
        print("push")
        var k = ButtonViewController()
        self.navigationController?.pushViewController(k, animated: true)
    }

    @IBAction func ApiTabView(_ sender: UIButton) {
        let tabVC = TabBarViewController()
        self.navigationController?.pushViewController(tabVC, animated: true)
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
