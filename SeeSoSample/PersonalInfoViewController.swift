//
//  PersonalInfoViewController.swift
//  SeeSoSample
//
//  Created by Alican Cennetkuşu on 4.06.2024.
//  Copyright © 2024 VisaulCamp. All rights reserved.
//


import UIKit
import AVFoundation
import AVKit
import WebKit
import JPSVolumeButtonHandler




class PersonalInfoViewController: UIViewController {
    
    @IBOutlet weak var resim1: UIImageView!
    @IBOutlet weak var scanForwardButton: UIButton!
    var customView: UIView!
    var webView: WKWebView!
    var volumeButtonHandler: JPSVolumeButtonHandler!
    var blink = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Create and configure the custom view
        customView = UIView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(customView)
        
        // Set up constraints for customView
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            customView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            customView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        
        
        let myAudiovisualMediaType: WKAudiovisualMediaTypes = []
        // Create WKWebView configuration
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        
        webConfiguration.mediaTypesRequiringUserActionForPlayback = .ArrayLiteralElement()
        if #available(iOS 10.0, *) {
            webConfiguration.mediaTypesRequiringUserActionForPlayback = []
            webConfiguration.mediaTypesRequiringUserActionForPlayback = .audio
        }
        
        // Create and configure WKWebView
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        customView.addSubview(webView)
        
        // Set up constraints for webView
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: customView.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: customView.trailingAnchor),
            webView.topAnchor.constraint(equalTo: customView.topAnchor),
            webView.bottomAnchor.constraint(equalTo: customView.bottomAnchor)
        ])
        
        // Load the livestream URL
        if let url = URL(string: "http://172.20.10.8") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        // Initialize the volume button handler
        volumeButtonHandler = JPSVolumeButtonHandler(up: {
            // Volume Up Button Pressed
            self.handleVolumeUp()
        }, downBlock: {
            // Volume Down Button Pressed
            self.handleVolumeDown()
        })
        
        // Start monitoring the volume button presses
        volumeButtonHandler.start(true)
    }
    func handleVolumeUp() {
        print("seizure detect")
        blink += 1
        if blink % 1 == 0 {
            callNumber(phoneNumber: "05077069801")
        }
        
        print("")
    }
    
    private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url)
        
    }

    func handleVolumeDown() {
        // Handle volume down button press
        print("seizure detect")
    }
    
    @IBAction func goToScanning(_ sender: Any) {
        self.performSegue(withIdentifier: K.scanningSegue, sender: self)
    }
}
    

