//
//  ZWWBreedTableViewController.swift
//  DogsC
//
//  Created by Zebadiah Watson on 10/10/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class ZWWBreedTableViewController: UITableViewController {
    //local source of truth
    var breeds: [ZWWBreed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ZWWBreedController.shared().fetchBreeds { (breeds) in
            DispatchQueue.main.async {
                self.breeds = breeds
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return breeds.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breedCell", for: indexPath)
        let breed = breeds[indexPath.row]
        cell.textLabel?.text = breed.name
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
}
