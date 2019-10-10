//
//  ZWWSubBreedTableViewController.swift
//  DogsC
//
//  Created by Zebadiah Watson on 10/10/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class ZWWSubBreedTableViewController: UITableViewController {
    
    
    //receiver
    
    var breed: ZWWBreed?
    
    //SOT
    var subbreed: [ZWWSubBreeds] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            guard let breed = self.breed else { return }
            self.subbreed = breed.subbreeds
            self.tableView.reloadData()
        }
    }
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subbreed.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subbreedCell", for: indexPath)
        let subbreeds = subbreed[indexPath.row]
        cell.textLabel?.text = subbreeds.name
        
        // Configure the cell...
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCollectionVC" {
            guard let indexPath = tableView.indexPathForSelectedRow, let breed = breed else { return }
            guard let destinationVC = segue.destination as? ZWWImageCollectionViewController else { return }
            let breedToSend = subbreed[indexPath.row]
            
            //send both sets of information to collection view
            destinationVC.subbreed = breedToSend
            destinationVC.breed = breed
        }
    }
}


