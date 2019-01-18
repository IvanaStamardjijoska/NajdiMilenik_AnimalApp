//
//  ProfileViewController.swift
//  Project
//
//  Created by Lazar Simonovski on 11/25/18.
//  Copyright © 2018 Ivana Stamardjioska. All rights reserved.
//

import UIKit
import  FirebaseDatabase
import Kingfisher
import FirebaseAuth

class ProfileViewController: UIViewController {

    var profileRefence: DatabaseReference!
    //Outlets
    
    //Images
    
    @IBOutlet weak var profileImage: UIImageView!
   
    
    @IBOutlet weak var imeTextField: UITextField!
    @IBOutlet weak var prezimeTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        confugureTextfields()
        
        //layer.cornerRadius image
        
        profileImage.layer.cornerRadius = 50
        profileImage.clipsToBounds = true
        
        
        profileRefence = Database.database().reference().child("Profile")
        
        let url = URL(string: "https://lh3.googleusercontent.com/-InnVyYhZunM/WeutoD26cfI/AAAAAAAAAFk/ywtARYvHmosvEMwdRvjBC3SK5OOANgeXwCEwYBhgL/w140-h140-p/d8424608-5e90-4756-b792-38a4686782c7")
        profileImage.kf.setImage(with:url)
    }
    func addProfile() {
        let key = profileRefence.childByAutoId().key
        let profile = ["id" : key, "Ime": imeTextField.text! as String, "Prezime" : prezimeTextField.text! as String]
        
        profileRefence.child(key!).setValue(profile)
        
        profileRefence.observe(.value, with: { (snapshot) in
            if let value = snapshot.value as? Dictionary<String,Any?> {
                if let Ime = value["ime"] as? String{
                    Ime == self.imeTextField.text!
                }
                
            }
            
        })
        
        
    }
    
    // Action
    
        
    @IBAction func saveBtn(_ sender: Any) {
        
            addProfile()
        
        }
    
    
      private func  confugureTextfields(){
        
        
        imeTextField.delegate = self as? UITextFieldDelegate
        prezimeTextField.delegate = self as? UITextFieldDelegate
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

}
