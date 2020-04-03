//
//  SecondViewController.swift
//  pate0910_a4
//
//  Created by Prism Student on 2020-02-27.
//  Copyright © 2020 Pranav Patel. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var fruit: Fruit?
    @IBOutlet weak var addedFruit: UIImageView!
    @IBOutlet weak var addedFruitName: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func cancelButton(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func fruitNameEdited(addedFruitName: UITextField){
        addedFruitName.resignFirstResponder()
        if(addedFruitName.text!.count != 0){saveButton.isEnabled = true}
        
    }
    
    @IBAction func fruitNameChanged(addedFruitName: UITextField){
        addedFruitName.resignFirstResponder()
        if (addedFruitName.text!.count == 0){
            saveButton.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        let name = addedFruitName.text!
        let image = addedFruit?.image
        fruit = Fruit(fruitName: name, fruitImage: image!, likes: 0, disLikes: 0)
        guard let button = sender as? UIBarButtonItem, button === saveButton else{
            return
        }
    }
    func getFruit() -> Fruit{
        return self.fruit!
    }
    
    
       override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            let startImage = UIImage(named: "question")
            addedFruit.image = startImage

            addedFruit.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            addedFruit.addGestureRecognizer(tap)

            addedFruit.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(addedFruit)
            saveButton.isEnabled = false
        }

       override func viewWillAppear(_ animated: Bool) {
            saveButton.isEnabled = false
       }


       /*
        check when image tapped and let user select picture
        */
       @objc func imageTapped(recognizer: UITapGestureRecognizer){
           let imagePickerController = UIImagePickerController()
           
           imagePickerController.sourceType = .photoLibrary
           
           imagePickerController.delegate = self
           self.present(imagePickerController, animated: true, completion: nil)
       }
       
       /*
        image picker helpers
        */
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           let image = info[.originalImage] as? UIImage
           addedFruit.image = image
           picker.dismiss(animated: true, completion: nil)
       }
       
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           picker.dismiss(animated: true, completion: nil)
       }
}

