//
//  FirstViewController.swift
//  pate0910_a4
//
//  Created by Prism Student on 2020-02-27.
//  Copyright © 2020 Pranav Patel. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Setup
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        let setHeight = CGFloat(150) //change here for table height manual override
        tableView.rowHeight = setHeight;
        _ = SharingFruitCollection()
        SharingFruitCollection.sharedFruitCollection.fruitCollection = FruitCollection()
        let theSharedCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection
        theSharedCollection?.add(fruitName: "apple", fruitImage: UIImage(named: "apple.jpg")!, likes: 0, disLikes: 0)
        theSharedCollection?.add(fruitName: "banana", fruitImage: UIImage(named: "banana.jpg")!, likes: 0, disLikes: 0)
        theSharedCollection?.add(fruitName: "kiwi", fruitImage: UIImage(named: "kiwi.jpg")!, likes: 0, disLikes: 0)
        theSharedCollection?.add(fruitName: "orange", fruitImage: UIImage(named: "orange.jpg")!, likes: 0, disLikes: 0)

        super.viewDidLoad()
        SharingFruitCollection.sharedFruitCollection.loadFruitCollection() // un-archive data
        tableView.reloadData()
    }
    
    // reload data once user goes back to table
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = SharingFruitCollection()
        SharingFruitCollection.sharedFruitCollection.fruitCollection = FruitCollection()
        let theSharedCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection
        theSharedCollection?.setCurrentIndex(to: indexPath.row)
        performSegue(withIdentifier: "fruitDetailView", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return FruitCollection.collection.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        _ = SharingFruitCollection()
        SharingFruitCollection.sharedFruitCollection.fruitCollection = FruitCollection()
        let theSharedCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        theSharedCollection!.setCurrentIndex(to: indexPath.row)
        cell.fruitLabel.text = theSharedCollection?.getName()
        cell.fruitImage.image = theSharedCollection?.getImage()
        cell.likeLabel.text = String(describing: theSharedCollection!.getLikes())
        cell.dislikeLabel.text = String(describing: theSharedCollection!.getDisLikes())
        return cell
    }
 
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            FruitCollection.collection.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func unwindToTableView(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? AddViewController{
            let fruit = sourceViewController.getFruit()
            FruitCollection.collection.append(fruit)
        }
        tableView.reloadData()
    }
}

