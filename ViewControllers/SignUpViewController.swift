//
//  SignUpViewController.swift
//  Project
//
//  Created by Lazar Simonovski on 11/25/18.
//  Copyright © 2018 Ivana Stamardjioska. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Kingfisher
import FirebaseStorage



class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
  
    //Outlets
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var profileImage: UIImageView!
    var selectedImage: UIImage?
    let imagePicker = UIImagePickerController()
    var imageURL = UIImage?.self
    
    let filename = "ivana.jpg"
    var imageReference: StorageReference {
        return Storage.storage().reference().child("images")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        let url = URL(string: "https://lh3.googleusercontent.com/-InnVyYhZunM/WeutoD26cfI/AAAAAAAAAFk/ywtARYvHmosvEMwdRvjBC3SK5OOANgeXwCEwYBhgL/w140-h140-p/d8424608-5e90-4756-b792-38a4686782c7")
        profileImage.kf.setImage(with:url)
        
        
        //UserName
        
        userNameTextField.backgroundColor = UIColor.clear
       userNameTextField.textColor = UIColor.white
        userNameTextField.tintColor = UIColor.white
        userNameTextField.attributedPlaceholder = NSAttributedString(string: userNameTextField.placeholder!,attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        
        let bootomLayerUserName = CALayer()
        bootomLayerUserName.frame = CGRect (x: 0, y: 29, width: 1000, height: 0.6)
        bootomLayerUserName.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
      userNameTextField.layer.addSublayer(bootomLayerUserName)
        
        //Email

        
        emailTextField.backgroundColor = UIColor.clear
        emailTextField.textColor = UIColor.white
        emailTextField.tintColor = UIColor.white
        emailTextField.attributedPlaceholder = NSAttributedString(string: emailTextField.placeholder!,attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        
        let bootomLayerEmail = CALayer()
        bootomLayerEmail.frame = CGRect (x: 0, y: 29, width: 1000, height: 0.6)
        bootomLayerEmail.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        emailTextField.layer.addSublayer(bootomLayerEmail)
        
        //Password
        
        
        passwordTextField.backgroundColor = UIColor.clear
        passwordTextField.textColor = UIColor.white
        passwordTextField.tintColor = UIColor.white
        passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder!,attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        
        let bootomLayerPassword = CALayer()
        bootomLayerEmail.frame = CGRect (x: 0, y: 29, width: 1000, height: 0.6)
        bootomLayerPassword.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        emailTextField.layer.addSublayer(bootomLayerPassword)
    
    // Profile Image
     profileImage.layer.cornerRadius = 50
     profileImage.clipsToBounds = true
       
        
    }
    
    
    @IBAction func savePhoto(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        guard let image = profileImage.image
            else { return }
        guard let imageData = UIImageJPEGRepresentation(image, 1) else { return }
        let uploadImageRef = imageReference.child(filename)
        
        let uploadTask = uploadImageRef.putData(imageData, metadata: nil) {
            (metada, error) in
            print("UPLOAD TASK FINISHED")
            print(metada ?? "NO METADATA")
            print(error ?? "NO ERROR")
            
        }
        
        uploadTask.observe(.progress) { (snapshot) in
            print(snapshot.progress ?? "NO MORE PROGRESS")
        }
        uploadTask.resume()
     
    
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImage.image = image
        }
        picker.dismiss(animated: true, completion: nil);
    }
    
    
    
   
    
        func signUpBtn_TouchupIn() {
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authResult, error) in
            if let user = authResult?.user{
                print("user is created")
                var ref: DatabaseReference!
                ref = Database.database().reference()
                let userReference =  ref.child("users")
                let uid =  user.uid
                let newUserReference =  userReference.child(uid)
                newUserReference.setValue(["name" : self.userNameTextField.text!, "email" : self.emailTextField.text!])
                
            }
            else {
                print("Error")
            }
            
        }
            
        }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}

