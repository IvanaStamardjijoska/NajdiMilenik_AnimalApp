//
//  SignInViewController.swift
//  Project
//
//  Created by Lazar Simonovski on 11/24/18.
//  Copyright © 2018 Ivana Stamardjioska. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class SignInViewController: UIViewController {
    
 // Outlets

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Email
        
        emailTextField.backgroundColor = UIColor.clear
        emailTextField.textColor = UIColor.white
        emailTextField.tintColor = UIColor.white
        emailTextField.attributedPlaceholder = NSAttributedString(string: emailTextField.placeholder!,attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        
        let bootomLayerEmail = CALayer()
        bootomLayerEmail.frame = CGRect (x: 0, y: 29, width: 1000, height: 0.6)
        bootomLayerEmail.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        emailTextField.layer.addSublayer(bootomLayerEmail)
        
        // Password
        
        passwordTextField.backgroundColor = UIColor.clear
        passwordTextField.textColor = UIColor.white
        passwordTextField.tintColor = UIColor.white
        passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder!,attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        
        let bootomLayerPassword = CALayer()
        bootomLayerEmail.frame = CGRect (x: 0, y: 29, width: 1000, height: 0.6)
        bootomLayerPassword.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        emailTextField.layer.addSublayer(bootomLayerPassword)
        
        //Logo Image
        
        logoImage.layer.cornerRadius = 100
        logoImage.clipsToBounds = true
        
    }

    
}
       

    


