//
//  SecondViewController.swift
//  SeeSoSample
//
//  Created by Alican Cennetkuşu on 4.06.2024.
//  Copyright © 2024 VisaulCamp. All rights reserved.
//


struct K {
    static let appName = "✚NoObstacle✚"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToInfo"
    static let loginSegue = "LoginToInfo"
    static let scanningSegue = "scanningSegue"
    static let cameraSegue = "infoToCamera"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
