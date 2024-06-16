//
//  RegisterViewController.swift
//  SeeSoSample
//
//  Created by Alican Cennetkuşu on 4.06.2024.
//  Copyright © 2024 VisaulCamp. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            registerUser(email: email, password: password)
        }
    }
    
    func registerUser(email: String, password: String) {
        let url = URL(string: "https://your-backend-url.com/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body: [String: Any] = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "No data")")
                return
            }
            
            let httpResponse = response as? HTTPURLResponse
            if httpResponse?.statusCode == 200 {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            } else {
                print("Registration failed with status code: \(httpResponse?.statusCode ?? 0)")
                // Hata durumunda kullanıcıya mesaj gösterilebilir
            }
        }
        
        task.resume()
    }
}
