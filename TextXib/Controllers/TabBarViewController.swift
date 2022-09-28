//
//  TabBarViewController.swift
//  TextXib
//
//  Created by Zaggle on 27/09/22.
//

import UIKit

class TabBarViewController: UITabBarController {
        var val = ""
        var k:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let petitions = PetitionsViewController()
        let recents = RecentsViewController()
        self.setViewControllers([petitions,recents], animated: false)
        guard let items = self.tabBar.items else{
            return
        }
        
        let images = ["note.text","clock.fill"]
        
        for x in 0..<items.count{
            items[x].badgeValue = String(images[x].count)
            items[x].image = UIImage(systemName: images[x])
        }
        
        
        
        
//        self.view.addSubview(<#T##view: UIView##UIView#>)
        // Do any additional setup after loading the view.
    }

}
