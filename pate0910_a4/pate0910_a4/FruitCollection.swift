//
//  FruitCollection.swift
//  pate0910_a4
//
//  Created by Prism Student on 2020-02-15.
//  Copyright © 2020 Pranav Patel. All rights reserved.
//
import Foundation
import UIKit
class FruitCollection: NSObject, NSCoding {
    static var collection = [Fruit]() // a collection is an array of fruits
    static var current:Int = 0 // the current fruit in the collection (to be shown in thescene)

    let collectionKey = "collectionKey"
    let currentKey = "currentKey"

    // MARK: - NSCoding methods
    override init(){
        super.init()
        //setup()
    }
    
    //add function
    func add(fruitName: String, fruitImage: UIImage, likes: Int, disLikes: Int){
        let fruit = Fruit(fruitName: fruitName, fruitImage: fruitImage, likes: likes, disLikes: disLikes)
        FruitCollection.collection.append(fruit!)
    }
    
    //getter functions
    func getName() -> String{
        let fruit = FruitCollection.collection[FruitCollection.current]
        return fruit.fruitName
    }
    func getImage() -> UIImage{
        let fruit = FruitCollection.collection[FruitCollection.current]
        return fruit.fruitImage
    }
    func getLikes() -> Int{
        let fruit = FruitCollection.collection[FruitCollection.current]
        return fruit.likes
    }
    func getDisLikes() -> Int{
          let fruit = FruitCollection.collection[FruitCollection.current]
          return fruit.disLikes
    }
    func getCurrentIndex() -> Int {
        return FruitCollection.current
    }
    func getCurrentFruit() -> Fruit {
        let fruit = FruitCollection.collection[FruitCollection.current]
        return fruit
    }
    
    //setter functions
    func setCurrentIndex(to index: Int){
        FruitCollection.current = index
    }
    func setDislikes(to dislike: Int){
        
        let fruit = FruitCollection.collection[FruitCollection.current]
        fruit.disLikes = dislike
    }
    func setlikes(to like: Int){
        let fruit = FruitCollection.collection[FruitCollection.current]
        fruit.likes = like
    }
    
    //computation functions
    func addLikes(){
        let fruit = FruitCollection.collection[FruitCollection.current]
        fruit.likes += 1
    }
    func addDisLikes(){
        let fruit = FruitCollection.collection[FruitCollection.current]
        fruit.disLikes += 1
    }
    
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        FruitCollection.collection = (decoder.decodeObject(forKey: collectionKey) as? [Fruit])!
        FruitCollection.current = (decoder.decodeInteger(forKey: currentKey))
 }

    func encode(with acoder: NSCoder) {
        acoder.encode(FruitCollection.collection, forKey: collectionKey)
        acoder.encode(FruitCollection.current, forKey: currentKey)
 }
 // Mark: - Helpers
}
