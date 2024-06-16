//
//  SecondViewController.swift
//  SeeSoSample
//
//  Created by Alican Cennetkuşu on 4.06.2024.
//  Copyright © 2024 VisaulCamp. All rights reserved.
//


import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            if email == "ali" && password == "123" {
                self.performSegue(withIdentifier: K.loginSegue, sender: self)
            }
        }
    }
}
