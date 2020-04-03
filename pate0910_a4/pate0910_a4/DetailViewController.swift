//
//  SecondViewController.swift
//  pate0910_a4
//
//  Created by Prism Student on 2020-02-27.
//  Copyright © 2020 Pranav Patel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var fruitLabel: UILabel!
    @IBOutlet weak var likeLable: UILabel!
    @IBOutlet weak var dislikeLable: UILabel!
    @IBOutlet weak var fruitImage: UIImageView!
    @
    IBAction func dislikeButton(_ sender: Any) {
        _ = SharingFruitCollection()
        SharingFruitCollection.sharedFruitCollection.fruitCollection = FruitCollection()
        let theSharedCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection
        if (FruitCollection.collection.count == 0){
            clear()
        }
        else{
            var imageIndex = 0
            // this statement will get the current index
            imageIndex = theSharedCollection!.getCurrentIndex()
            theSharedCollection?.addDisLikes() // setter function for dislikes called
            dislikeLable.text = String("\(FruitCollection.collection[imageIndex].disLikes)")
        }
        
    }
    @IBAction func likeButton(_ sender: Any) {
        _ = SharingFruitCollection()
        SharingFruitCollection.sharedFruitCollection.fruitCollection = FruitCollection()
        let theSharedCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection
        if (FruitCollection.collection.count == 0){
            clear()
        }
        else{
            var imageIndex = 0
            // this statement will get the current index
            imageIndex = theSharedCollection!.getCurrentIndex()
            theSharedCollection?.addLikes() // setter function for likes
            likeLable.text = String("\(FruitCollection.collection[imageIndex].likes)")
        }
    }
    @IBAction func nextButton(_ sender: Any) {
        _ = SharingFruitCollection()
        SharingFruitCollection.sharedFruitCollection.fruitCollection = FruitCollection()
        let theSharedCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection
        if (FruitCollection.collection.count == 0){
            clear()
        }
        else{
            var f_index = theSharedCollection?.getCurrentIndex()
            f_index! += 1
            if f_index! >= (FruitCollection.collection.count){
                f_index = 0 // reset to 0 for loop
            }
            theSharedCollection!.setCurrentIndex(to: f_index!)
            refresh()
        }
    }
    override func viewDidLoad() {
        refresh()
        super.viewDidLoad()
    }
    
    var sharedFruitCollection : FruitCollection?
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sharedFruitCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection
        refresh()
    }

    /*
     what ever the current collection is, this function will get the current data
     */
    func refresh(){
        _ = SharingFruitCollection()
        SharingFruitCollection.sharedFruitCollection.fruitCollection = FruitCollection()
        let theSharedCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection
        
        if (FruitCollection.collection.count == 0){
            clear()
        }
        else{
            let initialImage = theSharedCollection?.getImage()
            fruitImage.image = initialImage
            fruitLabel.text = theSharedCollection?.getName()
            dislikeLable.text = String(describing: theSharedCollection!.getDisLikes())
            likeLable.text = String(describing: theSharedCollection!.getLikes())
        }
    }
    func clear(){
        fruitImage.image = UIImage(named: "question")
        fruitLabel.text = ""
        dislikeLable.text = "0"
        likeLable.text = "0"
    }

}

