//
//  IntroviewController.swift
//  Dicee
//
//  Created by Felix Haas on 24.11.17.
//  Copyright © 2017 Felix Haas. All rights reserved.
//

import Foundation
import UIKit
import ConfettiView

class introViewController : UIViewController {
    
    @IBOutlet weak var meloText: UILabel!
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var termAndConditions: UILabel!
    @IBOutlet weak var getStartedButtonBorder: UIImageView!
    @IBOutlet weak var getStartedButton: UILabel!
    @IBOutlet weak var meloLogo: UIImageView!
    @IBOutlet weak var meloName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(introViewController.imageTapped(gesture:)))

        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        
        super.viewDidLayoutSubviews()
        meloLogo.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 239, height: 115)
        let centerOfScreenX = (self.view.frame.size.width / 2) - (meloLogo.frame.width / 2)
        let centerOfScreenY = (self.view.frame.size.height / 2) - (meloLogo.frame.height / 2)
        meloLogo.frame = CGRect(x: centerOfScreenX, y: centerOfScreenY, width: 239, height: 115)
        
        getStartedButton.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 297, height: 77)
        let centerOfScreenX1 = (self.view.frame.size.width * 0.5) - (getStartedButton.frame.width / 2)
        let centerOfScreenY1 = (self.view.frame.size.height * 0.797) - (getStartedButton.frame.height / 2)
        getStartedButton.frame = CGRect(x: centerOfScreenX1, y: centerOfScreenY1, width: 297, height: 77)

        getStartedButtonBorder.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 297, height: 77)
        let centerOfScreenX2 = (self.view.frame.size.width * 0.5) - (getStartedButtonBorder.frame.width / 2)
        let centerOfScreenY2 = (self.view.frame.size.height * 0.8) - (getStartedButtonBorder.frame.height / 2)
        getStartedButtonBorder.frame = CGRect(x: centerOfScreenX2, y: centerOfScreenY2, width: 297, height: 77)
    
        termAndConditions.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 297, height: 77)
        let centerOfScreenX3 = (self.view.frame.size.width * 0.5) - (termAndConditions.frame.width / 2)
        let centerOfScreenY3 = (self.view.frame.size.height * 0.88) - (termAndConditions.frame.height / 2)
        termAndConditions.frame = CGRect(x: centerOfScreenX3, y: centerOfScreenY3, width: 297, height: 77)
        
        welcomeText.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 224, height: 48)
        let centerOfScreenX4 = (self.view.frame.size.width * 0.5) - (welcomeText.frame.width / 2)
        let centerOfScreenY4 = (self.view.frame.size.height / 7) - (welcomeText.frame.height / 2)
        welcomeText.frame = CGRect(x: centerOfScreenX4, y: centerOfScreenY4, width: 224, height: 48)
        
        meloText.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 317, height: 72)
        let centerOfScreenX5 = (self.view.frame.size.width * 0.5) - (meloText.frame.width / 2)
        let centerOfScreenY5 = (self.view.frame.size.height / 4) - (meloText.frame.height / 2)
        meloText.frame = CGRect(x: centerOfScreenX5, y: centerOfScreenY5, width: 317, height: 72)
    }

    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            //Here you can initiate your new ViewController
            let mapViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "gameView") as? ViewController
            let navigationController = UINavigationController(rootViewController: mapViewControllerObj!)
            navigationController.navigationBar.isHidden = true
            self.present(navigationController, animated: true, completion: nil)

        }
    }
    
    
    
    
}
