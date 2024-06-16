//
//  InfoCardViewController.swift
//  SeeSoSample
//
//  Created by Alican Cennetkuşu on 5.06.2024.
//  Copyright © 2024 VisaulCamp. All rights reserved.
//

import Foundation
import UIKit
class InfoCardViewController: UIViewController {
    
    
    @IBOutlet weak var segueButton: UIButton!
    
    
    @IBOutlet weak var image: UIImageView!
    
    
    @IBOutlet weak var tapbutton: UIButton!
    
    
    @IBOutlet weak var boy: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.size.width / 4
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        tapgasture()
        
        
    }
    func tapgasture(){
        let tap = UITapGestureRecognizer(target:self, action: #selector(imageTapped))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tap)
    }
    @objc func imageTapped(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate=self
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
}
    extension InfoCardViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo
                                   info: [UIImagePickerController.InfoKey : Any]) {
            image.image = info[.originalImage] as? UIImage
            dismiss(animated: true, completion: nil)
        }
        @IBAction func goToCamera(_ sender: Any) {
            self.performSegue(withIdentifier: K.cameraSegue, sender: self)
            
        }
    }
    

