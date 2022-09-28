//
//  PetitionsViewController.swift
//  TextXib
//
//  Created by Zaggle on 27/09/22.
//

import UIKit

class PetitionsViewController: UIViewController {
    
    var petitions = [Petition]()
    
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return 5
    //    }
    //
    //    var petitions = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: "viewTableViewCell", bundle: nil), forCellReuseIdentifier: "viewTableViewCell")
        super.viewDidLoad()
        self.title = "Petitions"
       tableView.delegate = self
        tableView.dataSource = self
        let urlString =  "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        if let url = URL(string: urlString){
            DispatchQueue.global(qos: .default).async {
                if let data = try? Data(contentsOf: url){
                    
                    self.parse(json: data)
                }
            }
        }
        
    }
    
    
    
    
    
    
}



extension PetitionsViewController: UITableViewDelegate, UITableViewDataSource{
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return petitions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: viewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "viewTableViewCell") as! viewTableViewCell
        let p = petitions[indexPath.row]
        cell.label.text = String(p.title.prefix(5))
        cell.txt = String(indexPath.row)
        let m =  NaviViewController()
        cell.ClousureBtnActionHandler = { sender in
                m.val = String(indexPath.row)
                self.navigationController?.pushViewController(m, animated: true)
                }
        return cell
        }

    func parse(json: Data){
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){
            print(jsonPetitions)
            
            petitions = jsonPetitions.results
            DispatchQueue.main.async {
                self.tableView.reloadData()

            }
            
        }
      
    }
    

    
}
