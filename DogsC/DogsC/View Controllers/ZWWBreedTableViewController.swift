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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let breed = breeds[indexPath.row]
        if breed.subbreeds.count == 0 {
            self.performSegue(withIdentifier: "toCollectionVC", sender: self)
        } else {
            self.performSegue(withIdentifier: "toSubbreedVC", sender: self)
        }
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
        
        if segue.identifier == "toSubbreedVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let destinationVC = segue.destination as? ZWWSubBreedTableViewController else { return }
            let breedToSend = breeds[indexPath.row]
            destinationVC.breed = breedToSend
        } else  if segue.identifier == "toCollectionVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let destinationVC = segue.destination as? ZWWImageCollectionViewController else { return }
            let breedToSend = breeds[indexPath.row]
            destinationVC.breed = breedToSend
        }
    }
    
}// end of Class
